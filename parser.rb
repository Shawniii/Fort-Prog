def plus(e1,e2)
  return {:type => :plus,
          :fst  => e1,
          :snd  => e2 }
end

def minus(e1,e2)
  return {:type => :minus,
          :fst  => e1,
          :snd  => e2 }
end

def mult(e1,e2)
  return {:type => :mult,
          :fst  => e1,
          :snd  => e2 }
end

def var(var_name)
  return {:type => :var,
          :name => var_name }
end

def number(value)
  return {:type => :number,
          :value => value }
end

def eva(e,env)
  case e[:type]
    when :number
      return e[:value]
    when :var
      return env[e[:name]]
    when :plus
      return eva(e[:fst],env) + eva(e[:snd],env)
    when :minus
      return eva(e[:fst],env) - eva(e[:snd],env)
    when :mult
      return eva(e[:fst],env) * eva(e[:snd],env)
  end
end

def parse_exp(s)
  begin
    res = exp(s,0)
    e = res[0]
    p = res[1]
    if p==s.length then
      return e
    else
      raise "unexpected symbol '"+s[p]+"' in column "+p.to_s
    end
  rescue => err
    puts err
    return nil
  end
end

def exp(s,p)
  if s[p] == '(' then
    res1 = exp(s,p+1)
    e1 = res1[0]
    p1 = res1[1]
    res2 = exp(s,p1+1)
    e2 = res2[0]
    p2 = res2[1]
    if s[p2] == ')' then
      case s[p1]
        when "+"
          return [plus(e1,e2),p2+1]
        when "-"
          return [minus(e1,e2),p2+1]
        when "*"
          return [mult(e1,e2),p2+1]
        else
          raise "unexpected symbol '"+s[p1]+"' at column "+p1.to_s
      end
    else
      raise "')' expected in column "+p2.to_s
    end
  else
    match = /[1-9][0-9]*|0/.match(s[p,s.length])
    if match != nil && match.pre_match=="" then
      num_str = match[0]
      return [number(num_str.to_i), p+num_str.length]
    else
      if s[p] == "x" then
        return [var("x"),p+1]
      else
        raise "'(' or 'x' or number expected in column "+p.to_s
      end
    end
  end
end

e = nil
while e == nil do
  print "f(x) = "
  str = gets.chop
  e = parse_exp(str)
end

print "Von: "
von = gets.to_i
print "Bis: "
bis = gets.to_i

for x in von..bis do
  puts "f("+x.to_s+") = "+ eva(e,{"x" => x}).to_s
end


