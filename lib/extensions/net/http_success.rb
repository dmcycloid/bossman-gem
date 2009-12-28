require 'zlib'
require 'stringio'

module Net
  class HTTPSuccess

    def body
      if self['content-encoding'] == 'gzip'
        body = StringIO.new(super)
        uncompressed_body = Zlib::GzipReader.new(body)
        uncompressed_body.read
      else
        super
      end
    end

  end
end