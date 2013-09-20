class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indents = 0
  end

  def make_tag (tag, options = {})
    if @indent
      prefix = "  " * @indents
      @indents += 1
      suffix = "\n"
    else
      prefix = ""
      suffix = ""
    end

    if !options.empty?
      middle = "<#{tag} #{options.first[0].to_s}='#{options.first[1]}'/>"
    elsif block_given?
      middle = "<#{tag}>#{suffix}#{yield}#{prefix}</#{tag}>"
    else
      middle = "<#{tag}/>"
    end

    return prefix + middle + suffix
  end

  def method_missing(method,*args,&block)
    make_tag(method.to_s, *args, &block)
  end
end