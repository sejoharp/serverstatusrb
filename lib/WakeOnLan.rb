# K.Kodama 2003-04-20 revised/bug fix

# K.Kodama 2000-05-10

# This program is distributed freely

# in the sense of GNU General Public License or ruby's.



require "socket"
class WakeOnLan
  
  def initialize()
    @socket  = nil
  end
  def wake(mac_addr, broadcast="", ip_addr="")
    wol_magic=(0xff.chr)*6+(mac_addr.split(/:/).pack("H*H*H*H*H*H*"))*16
    if broadcast==""; # Set broadcast. Assume that standard IP-class.
      ips=ip_addr.split(/\./);c=ips[0].to_i
      if c  # class D:224--239 multicast
        broadcast=ips.join(".")
      end
    end
    self.open_socket()
    3.times{ @socket.send(wol_magic,0,broadcast,"discard") }
    self.close()
  end
  
  private

  def open_socket()
    @socket=UDPSocket.open()
    @socket.setsockopt(Socket::SOL_SOCKET,Socket::SO_BROADCAST,1)
  end
  def close()
    @socket.close;
    @socket="";
  end 
end
