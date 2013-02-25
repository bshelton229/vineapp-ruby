module VineApp
  class Resource
    attr_reader :title, :card, :description, :image, :site, :player, :player_width, :player_height, :player_stream,
                :player_stream_content_type

    def initialize(data)
      data.each do |k,v|
        instance_variable_set("@#{k}", v) if respond_to?(k.to_sym)
      end
    end

    # Shortcut to get the MP4 video file
    def video
      @player_stream
    end
  end
end
