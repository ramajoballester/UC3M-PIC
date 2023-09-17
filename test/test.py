import unittest
import torch

class AllTest(unittest.TestCase):
    # Test that pytorch is installed and print if it uses GPU or CPU
    def test_torch(self):
        if torch.cuda.is_available():
            print('CUDA is available')
        else:
            print('CUDA is not available. Using CPU')

    def test_import(self):
        import uc3m_pic
    


if __name__ == '__main__':
    unittest.main()

