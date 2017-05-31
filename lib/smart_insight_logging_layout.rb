require 'time'
require 'logging'
require 'multi_json'

class SmartInsightLoggingLayout < ::Logging::Layout
  require 'smart_insight_logging_layout/version'

  def initialize(context: {}, prefix: '')
    @initial_context = context
    @prefix = prefix
  end

  def format(event)
    message = base_message_by(event)
    add_initial_context_to(message)
    add_legacy_context_to(message)
    add_event_message_to(message, event)
    @prefix + ::MultiJson.dump(message) + "\n"
  end

  private

  def add_event_message_to(message, event)
    message.merge!(message_by(event.data))
  end

  def add_initial_context_to(message)
    message.merge!(@initial_context)
  end

  def add_legacy_context_to(message)
    message.merge!(Logging.mdc.context)
  end

  def base_message_by(event)
    {
      'logger' => event.logger,
      'timestamp' => event.time.iso8601,
      'level' => ::Logging::LNAMES[event.level],
      'hostname' => Socket.gethostname,
      'pid' => Process.pid
    }
  end

  def message_by(obj)
    case obj
    when String
      string_message_by(obj)
    when Exception
      exception_message_by(obj)
    when Time
      { message: obj.iso8601 }
    when Hash
      obj
    else
      { message: obj }
    end
  end

  def string_message_by(obj)
    value = try_parse_json(obj)
    if value.nil?
      { message: obj }
    else
      value
    end
  end

  def exception_message_by(exception)
    {
      error:
        {
          :class => exception.class.name,
          :message => exception.message,
          :backtrace => exception.backtrace.first(20)
        }
    }
  end

  def try_parse_json(string)
    ::MultiJson.load(string)
  rescue ::MultiJson::ParseError
    nil
  end
end
