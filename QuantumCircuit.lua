function QuantumCircuit ()

  local qc = {}

  local function set_registers (n,m)
    qc.n_qubits = n
    qc.n_bits = m or 0
  end
  qc.set_registers = set_registers

  qc.data = {}

  function qc.initialize (ket)
    ket_copy = {}
    for index, value in pairs(ket) do
      ket[index] = value
    end
    qc.data = {'init',ket_copy}
  end
      
  function qc.x (q)
    table.insert( qc.data, {'x',q} )
  end

  function qc.rx (theta,q)
    table.insert( qc.data, {'rx',theta,q} )
  end
  function qc.h (q)
    table.insert( qc.data, {'h',q} )
  end

  function qc.cx (s,t)
    table.insert( qc.data, {'cx',s,t} )
  end

  function qc.measure (q,b)
    table.insert( qc.data, {'m',q,b} )
  end

  function qc.rx (theta,q)
    qc.h(q)
    qc.rx(theta,q)
    qc.h(q)
  end

  function qc.ry (theta,q)
    qc.rx(math.pi/2,q)
    qc.rz(theta,q)
    qc.rx(-math.pi/2,q)
  end

  function qc.z (q)
    qc.rz(math.pi,q)
  end

  function qc.y (q)
    qc.z(q)
    qc.x(q)
  end

  return qc

end