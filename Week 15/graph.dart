class Graph {
  Map<int, List<int>> graph = {};

  void insert(int vertex, int edge, [bool bi = false]) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]?.add(edge);
    if (bi) {
      graph[edge]?.add(vertex);
    }
  }

  void showEdges(int vertex) {
    if (graph.containsKey(vertex)) {
      print(graph[vertex]);
    } else {
      print('value not found');
    }
  }

  void bfs(int vertex) {
    Set<int> visited = {};
    List<int> queue = [];
    visited.add(vertex);
    queue.add(vertex);
    while (queue.isNotEmpty) {
      int curr = queue[0];
      queue.removeAt(0);

      for (int i in graph[curr]!) {
        if (!visited.contains(i)) {
          visited.add(i);
          queue.add(i);
        }
      }
    }
    print(visited);
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(15, 21);
  graph.insert(15, 3);
  graph.insert(15, 4);
  graph.insert(15, 25);
  graph.insert(15, 14);
  graph.insert(15, 8);
  graph.bfs(8);
}
