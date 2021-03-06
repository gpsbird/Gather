# -*- coding:utf-8 -*-
from gather.api import EXCLUDE_COLUMNS

from gather.extensions import api_manager
from gather.node.models import Node


bp = api_manager.create_api_blueprint(
    Node,
    methods=["GET"],
    exclude_columns=EXCLUDE_COLUMNS
)
