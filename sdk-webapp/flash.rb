# Simple mechanism to flash messages to the user
#
class Flash
  include Enumerable

  def self.reset   
    @@msgs = nil
  end

  def self.active
    @@msgs != nil
  end

  def self.message
  end

  def self.each
    for name, importance in @@msgs do
      yield name, importance
    end
    reset
  end

  def self.to_user(msg, importance = :error)
    @@msgs = @@msgs || []
    @@msgs.push [msg, importance]
  end

  reset
end
