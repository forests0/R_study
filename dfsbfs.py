from collections import deque

N, M, V = map(int, input().split())
N = int(N)
M = int(M)
V = int(V)

graph = []
for i in range(N + 1):
    graph.append([])

for i in range(M):
    node = input().split()
    graph[int(node[0])].append(int(node[1]))
    graph[int(node[1])].append(int(node[0]))

for i in range(N + 1):
    graph[i].sort()

visited1 = [False] * (N + 1)
visited2 = [False] * (N + 1)

def DFS(v):
    visited1[v] = True
    print(v, end=' ')

    for node in graph[v]:
        if not visited1[node]:
            DFS(node)

def BFS(v):
    queue = deque([v])

    visited2[v] = True

    while queue:
        node = queue.popleft()
        print(node, end=' ')

        for i in graph[node]:
            if not visited2[i]:
                queue.append(i)
                visited2[i] = True

DFS(V)
print()
BFS(V)