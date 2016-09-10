"""Example unittests
    Contains tests for example_code
"""

import unittest
from stravadata.src.example_code import return_something

class TestsForReturnSomething(unittest.TestCase):
    """Testcases for function return_something"""

    def test_something_is_returned(self):
        """Ensure noddy test function returns something."""
        self.assertTrue(return_something())

    def test_the_something_that_is_returned_is_three(self): #pylint: disable=invalid-name
        """Ensure the noddy test function returns 3."""
        self.assertEqual(3, return_something())

if __name__ == '__main__':
    unittest.main()
