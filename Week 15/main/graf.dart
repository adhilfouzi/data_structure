class Graph {
  Map<int, List<int>> graph = {};
  void insert(int vertex, int edge, [bool bi = false]) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (bi) {
      graph[edge]!.add(vertex);
    }
  }

  void showEdge(int vertex) {
    if (graph.containsKey(vertex)) {
      print(graph[vertex]);
    } else {
      'value not found';
    }
  }

  void display() {
    graph.forEach((key, value) {
      print('$key : $value');
    });
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(15, 6);
  graph.insert(15, 1);
  graph.insert(15, 4);
  graph.insert(4, 8, true);
  graph.insert(15, 8, true);
  graph.insert(15, 20);
  graph.insert(15, 55);
  graph.showEdge(15);
  graph.display();
}
