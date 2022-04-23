using Revise

import Pluto: PlutoRunner, Notebook, WorkspaceManager, Cell, ServerSession, ClientSession, update_run!, build_tree

🍭 = ServerSession()
🍭.options.evaluation.workspace_use_distributed = false

fakeclient = ClientSession(:fake, nothing)
🍭.connected_clients[fakeclient.id] = fakeclient

notebook = Notebook(Cell.([
    "x = 1",

    "y = x",
    "y = 2",
]))

update_run!(🍭, notebook, notebook.cells)

tree = build_tree(notebook.topology, notebook.cells)
