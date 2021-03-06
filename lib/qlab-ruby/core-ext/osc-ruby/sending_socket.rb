module OSC
  module TCP
    # A wrapper around an open TCP socket providing SLIP encoding for outbound
    # messages.
    class SendingSocket
      def initialize socket
        @socket = socket
      end

      # send SLIP encoded OSC messages
      def send msg
        @socket_buffer = []

        enc_msg = msg.encode

        send_char CHAR_END

        enc_msg.bytes.each do |b|
          case b
          when CHAR_END
            send_char CHAR_ESC
            send_char CHAR_ESC_END
          when CHAR_ESC
            send_char CHAR_ESC
            send_char CHAR_ESC_ESC
          else
            send_char b
          end
        end

        send_char CHAR_END

        flush
      end

      private

      def flush
        @socket.send @socket_buffer.join, 0
      end

      def send_char c
        @socket_buffer << [c].pack('C')
      end
    end
  end
end
