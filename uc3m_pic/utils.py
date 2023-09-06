

def conv2d_output_size(input_size, kernel_size, padding=0, stride=1,
                          pool_kernel_size=1, pool_stride=1):
    
    conv_output = (input_size + 2*padding - kernel_size) // stride + 1
    pool_output = (conv_output - pool_kernel_size) // pool_stride + 1

    return pool_output