require 'smart_insight_logging_layout' unless defined?(SmartInsightLoggingLayout)
SmartInsightLoggingLayout::VERSION = File.read(File.join(File.dirname(__FILE__), '..', '..', 'VERSION')).strip