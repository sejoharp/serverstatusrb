# To change this template, choose Tools | Templates
# and open the template in the editor.

class Controller
  require "ping"
  def initialize()
    ret = Ping.pingecho("heise.de", 10, 80)
    puts(ret)
  end
end

status = ServerStatusRb.new()
wol = WakeOnLan.new()