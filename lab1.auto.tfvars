nodes = {
    lab = {
        nodedefinition = "external_connector"
        configuration = "bridge0"
        x = 500
        y = 700
    }
    oob-mgmt = {
        nodedefinition = "nxosv9000"
        imagedefinition = "N9K-10-3-2-F"
        x = 500
        y = 500
    }
}

links = {
    lab-oob = {
        node_a = "lab"
        slot_a = "i0"
        node_b = "oob-mgmt"
        slot_b = "i1"
    }
}