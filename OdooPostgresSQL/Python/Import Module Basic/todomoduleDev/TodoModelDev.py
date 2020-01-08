# -*- coding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.

from odoo import fields, models

class TodoModelDev (models.Model):
    _name='todo.module.dev'
    _description = 'to do descripcion module dev'
    name = fields.Char('Description', required=True)
    is_done = fields.Boolean('Done?')
    active = fields.Boolean('Active?' default=True)


