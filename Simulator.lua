local Simulator = {}

local function simulate (qc)

  ket = {1,0}
  for j=1,qc.n_qubits do
   table.insert(ket,{0,0})
  end
  
  return ket

end
Simulator.simulate = simulate

return Simulator