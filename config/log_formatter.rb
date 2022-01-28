class Logger::CustomFormatter < Logger::Formatter
  cattr_accessor(:datetime_format) { "%Y-%m-%d_%H:%M:%S" }

  def call(severity, timestamp, _progname, msg)
    "[#{timestamp.strftime(datetime_format)}.#{format('%06d', timestamp.usec)}] (pid=#{$PROCESS_ID}) #{severity} -- : #{msg.class == String ? msg : msg.inspect}\n"
  end
end
