module Jekyll

  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag

      tag_title_prefix = 'Tag: '
      self.data['title'] = "#{tag_title_prefix}#{tag}"
    end
  end

  class TagGenerator < Generator
    safe true
    
    def generate(site)

      site.tags.each do |tag|
        #usually you would use tags/ as desitination directory and not ../tags
        site.pages << TagPage.new(site, site.source, File.join('../tags', tag[0]), tag[0])
      end
    end
  end

end