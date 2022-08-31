require 'Set'

n = 5
# matriz de adjacência
grafo = Array.new(n) { Array.new(n) }
# cada par (i,j) representa a presença ou não de aresta entre os vertices
# onde i e j representam os vértices
# Consumo excessivo de memória, mas é fácil de implementar
# grafo[0][4] == true
# grafo[1][2] == false
# O vértice 0 tem uma aresta ligando ao vértice 4
# O vértice 1 não tem uma aresta ligando ao vértice 2


# Listas de adjacência
# O grafo é o seguinte: G = (V, E)
# G = ([1, 2, 3, 4, 5], [(1, 2), (2, 1), (1, 4) (3, 5), (4, 1)])
grafo = Array.new(n) { [] }
grafo[0] << 1 # (1, 2)
grafo[0] << 3 # (1, 4)
grafo[1] << 0 # (2, 1)
grafo[2] << 4 # (3, 5)
grafo[3] << 1 # (4, 1)

# Função que atualmente faz a busca em profundidade a partir de um único vertice
def dfs(graph, vertice)
	visited = Set.new # Conjunto vazio de vertices visitados
	recursive_dfs(graph, vertice, visited)
end


def recursive_dfs(graph, vertice, visited)
	visited.add(vertice) # Marca o vertice

	print "Inside vertice #{vertice}\n"
	graph[vertice].each do |neighbour| # Pra cada vizinho do vertice no grafo
		if !visited.include?(neighbour) # Checa se o vizinho já foi visitado
			recursive_dfs(graph, neighbour, visited) # Faz a busca em profundidade a partir do vizinho
		end
	end
end

dfs(grafo, 0)