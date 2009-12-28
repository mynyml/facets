class String

  # Remove excessive indentation. Useful for multi-line strings embeded in already indented code.
  #
  # ==== Example
  #
  #   puts <<-END.unindent
  #     ohaie
  #       wurld
  #   END
  #
  #   # outputs:
  #   ohaie
  #     wurld
  #
  #   # instead of:
  #     ohaie
  #       wurld
  #
  # CREDIT: mynyml

  def unindent
    indent = self.split("\n").select {|line| !line.strip.empty? }.map {|line| line.index(/[^\s]/) }.compact.min
    self.gsub(/^[[:blank:]]{#{indent}}/, '')
  end

  # Equivalent to String#unindent, but modifies the receiver in place.
  #
  # CREDIT: mynyml

  def unindent!
    self.replace(self.unindent)
  end
end
