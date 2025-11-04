import unittest
from Lab10_LynnAriss.app import greet

class TestApp(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("World"), "Hello, World from Lynn Ariss!") 

if __name__ == "__main__":
    unittest.main()
