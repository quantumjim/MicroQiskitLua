dofile("QuantumCircuit.lua")

local qc = QuantumCircuit()
qc.set_registers(2)

qc.h(0)
qc.cx(0,1)

for index, value in pairs(qc.data) do
  for i, v in pairs(value) do
    print(v)
  end
end

local sim = require("Simulator")
ket = sim.simulate(qc)

print(index,ket[0])
print(index,ket[1])


