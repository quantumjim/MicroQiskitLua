dofile("MicroQiskit.lua")

print("\nCircuit\n")

local qc = QuantumCircuit()
qc.set_registers(5,5)


qc.x(0)
qc.x(2)

--qc.rx(3.14/4,0)
--qc.cx(0,1)

for j=0,4 do
  qc.measure(j,j)
  qc.measure(j,j)
end


for index, value in pairs(qc.data) do
  for i, v in pairs(value) do
    print(v)
  end
  print("\n")
end

print("\nResults\n")

result = simulate(qc,"counts",10)

for index, value in pairs(result) do
  print(index,value)
end


