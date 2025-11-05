import unittest
from app import greet

class TestApp(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("Lynn Ariss"), "Hello, Lynn Ariss!")
