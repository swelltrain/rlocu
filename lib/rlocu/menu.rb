module Rlocu
  class Menu
    attr_accessor :name
    attr_reader :sections

    def initialize(meta_menu)
      @name = meta_menu['menu_name']
      self.sections = meta_menu['sections']
    end

    def sections=(meta_sections)
      @sections = []
      meta_sections.each {|h| @sections << Section.new(h)}
    end

    def to_s
      str = "Menu: #{name}\n"
      sections.each do |section|
        str << "-----#{section.name}-----\n"
        section.subsections.each do |subsection|
          str << "---#{subsection.name}---\n"
          subsection.contents.each do |content|
            case content
            when SectionText
              str << "SECTION TEXT : #{content.to_s}\n"
            when MenuItem
              str << "MENU ITEM : #{content.name} #{content.description} #{content.price}\n"
              content.option_groups.each do |opt_group|
                str << "OPTION GROUP : #{opt_group.text}\n"
                opt_group.options.each do |option|
                  str << "OPTION  :  #{option.to_s}\n"
                end
              end
            end
          end
        end
      end
      str
    end

    class Section
      attr_accessor :name
      attr_reader :subsections

      def initialize(meta_section)
        @name = meta_section['section_name']
        self.subsections = meta_section['subsections']
      end

      def subsections=(meta_subsections)
        @subsections = []
        meta_subsections.each {|h| @subsections << Subsection.new(h)}
      end

    end

    class Subsection
      attr_accessor :name
      attr_reader :contents

      def initialize(meta_subsection)
        @name = meta_subsection['subsection_name']
        self.contents = meta_subsection['contents']
      end

      def contents=(meta_contents)
        @contents = []
        meta_contents.each do |h|
          #TODO: raise error if type is different
          @contents << case h['type']
            when 'SECTION_TEXT'
              SectionText.new(h)
            when 'ITEM'
              MenuItem.new(h)
          end
        end
      end
    end

    class SectionText
      attr_accessor :type, :text

      def initialize(meta_section_text)
        @type = meta_section_text['type']
        @text = meta_section_text['text']
      end

      def to_s
        @text
      end
    end

    class Item
      attr_reader :type, :name, :description, :price, :option_groups
      def initialize(item_hash)
        @type = item_hash['type']
        @name = item_hash['name']
        @description = item_hash['description']
        @price = item_hash['price']
        self.option_groups = item_hash['option_groups']
      end

      def option_groups=(option_groups_list)
        @option_groups = []
        option_groups_list.each { |option_group| @option_groups << OptionGroup.new(option_group) }
      end
    end

    class MenuItem < Item
      attr_reader :menu_name, :section_name, :subsection_name, :section_text, :type, :currency_symbol, :photos
      def initialize(menu_item_hash)
        @menu_name = menu_item_hash['menu_name']
        @section_name = menu_item_hash['section_name']
        @subsection_name = menu_item_hash['subsection_name']
        @section_text = menu_item_hash['section_text']
        @currency_symbol = menu_item_hash['currency_symbol']
        self.photos = menu_item_hash['photos']
        super
      end

      def photos=(photos)
        # TODO: Are these really comma sep string?
        @photos = photos.split(',')
      end
    end

    class OptionGroup
      attr_reader :options, :type, :text
      def initialize(option_group_hash)
        @type = option_group_hash['type']
        @text = option_group_hash['text']
        self.options = option_group_hash['options']
      end

      def options=(options_list)
        @options = []
        options_list.each { |option| @options << Option.new(option) }
      end
    end

    class Option
      attr_reader :name, :price
      def initialize(option_hash)
        @name = option_hash['name']
        @price = option_hash['price']
        # price can be relative indicated by a + in the price
      end

      def to_s
        "#{name} #{price}"
      end
    end
  end
end
