# Function to empty the Recycle Bin

function Empty-RecycleBin {
    $shell = New-Object -ComObject Shell.Application
    
    # Get the Recycle Bin folder
    
    $recycleBin = $shell.Namespace(0xa)
    
    # Check if the Recycle Bin is empty
    
    if ($recycleBin.Items().Count -eq 0) {
        Write-Host "Recycle Bin is already empty."
        return
    }
    
    # Empty the Recycle Bin
    $recycleBin.Items() | foreach { $recycleBin.InvokeVerb("Delete") }
    
    Write-Host "Recycle Bin has been emptied."
    
}

# Call the function to empty the Recycle Bin
Empty-RecycleBin