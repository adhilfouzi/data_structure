import 'dart:collection';

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
    } else
      print('vale not found');
  }

  void display() {
    graph.forEach((key, value) {
      print('$key: $value');
    });
  }

  void bfs(int startVertex) {
    Set<int> visited = {};
    Queue<int> queue = Queue<int>();

    queue.add(startVertex);
    visited.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print('$currentVertex ');

      for (int neighbor in graph[currentVertex]!) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
          visited.add(neighbor);
        }
      }
    }
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(5, 20);
  graph.insert(5, 10);
  graph.insert(5, 20);
  graph.insert(5, 90);
  graph.insert(55, 50);
  graph.insert(5, 70);
  graph.showEdge(5);
  graph.bfs(5);
}
