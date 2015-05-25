path = require 'path-extra'
{$, $$, React, ReactBootstrap, ROOT} = window
{config, proxy} = window
{TabbedArea, TabPane, Table} = ReactBootstrap
getStyle = (state) ->
  switch state
    # Cond >= 40, Supplied, Repaired, In port
    when 0
      return 'btn-success'
    # 20 <= Cond < 40, or not supplied, or medium damage
    when 1
      return 'btn-warning'
    # Cond < 20, or heavy damage
    when 2
      return 'btn-danger'
    # Repairing
    when 3
      return 'btn-info'
    # In mission
    when 4
      return 'btn-primary'
    else
      return 'btn-default'
module.exports =
  name: 'ShipView'
  priority: 0.1
  displayName: '舰队'
  description: '舰队展示页面，展示舰队详情信息'
  reactClass: React.createClass
    getInitialState: ->
      name: ['', '第1艦隊', '第2艦隊', '第3艦隊', '第4艦隊']
      state: [-1, 0, 1, -1, -1]
      activeKey: 1
    handleClick: (e) ->
      console.log e
    render: ->
      <div>
        <link rel="stylesheet" href={path.join(path.relative(ROOT, __dirname), 'assets', 'ship.css')} />
        <TabbedArea bsStyle="pills" defaultActiveKey={1}>
        {
          for i in [1..4]
            <TabPane key={i} eventKey={i} tab="第#{i}艦隊">
              <Table>
              {
                for j in [1..6]
                  <tr key={j}><td>Ship {i} {j}</td></tr>
              }
              </Table>
            </TabPane>
        }
        </TabbedArea>
      </div>