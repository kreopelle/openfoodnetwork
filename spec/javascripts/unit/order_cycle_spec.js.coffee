describe 'OrderCycle controllers', ->

  describe 'AdminCreateOrderCycleCtrl', ->
    ctrl = null
    scope = null
    OrderCycle = null
    Enterprise = null

    beforeEach ->
      scope = {}
      OrderCycle =
        order_cycle: 'my order cycle'
        toggleProducts: jasmine.createSpy('toggleProducts')
        addSupplier: jasmine.createSpy('addSupplier')
        create: jasmine.createSpy('create')
      Enterprise =
        index: jasmine.createSpy('index').andReturn('enterprises list')
      ctrl = new AdminCreateOrderCycleCtrl(scope, OrderCycle, Enterprise)

    it 'Loads enterprises', ->
      expect(Enterprise.index).toHaveBeenCalled()
      expect(scope.enterprises).toEqual('enterprises list')

    it 'Loads order cycles', ->
      expect(scope.order_cycle).toEqual('my order cycle')

    it 'Delegates toggleProducts to OrderCycle', ->
      scope.toggleProducts('event', 'exchange')
      expect(OrderCycle.toggleProducts).toHaveBeenCalledWith('event', 'exchange')

    it 'Adds order cycle suppliers', ->
      scope.new_supplier_id = 'new supplier id'
      scope.addSupplier('event')
      expect(OrderCycle.addSupplier).toHaveBeenCalledWith('event', 'new supplier id')

    it 'Submits the order cycle via OrderCycle create', ->
      scope.submit()
      expect(OrderCycle.create).toHaveBeenCalled()

  describe 'AdminEditOrderCycleCtrl', ->
    ctrl = null
    scope = null
    location = null
    OrderCycle = null
    Enterprise = null

    beforeEach ->
      scope = {}
      location =
        absUrl: ->
          'example.com/admin/order_cycles/27/edit'
      OrderCycle =
        load: jasmine.createSpy('load')
        toggleProducts: jasmine.createSpy('toggleProducts')
        addSupplier: jasmine.createSpy('addSupplier')
        update: jasmine.createSpy('update')
      Enterprise =
        index: jasmine.createSpy('index').andReturn('enterprises list')
      ctrl = new AdminEditOrderCycleCtrl(scope, location, OrderCycle, Enterprise)

    it 'Loads enterprises', ->
      expect(Enterprise.index).toHaveBeenCalled()
      expect(scope.enterprises).toEqual('enterprises list')

    it 'Loads order cycles', ->
      expect(OrderCycle.load).toHaveBeenCalledWith('27')

    it 'Delegates toggleProducts to OrderCycle', ->
      scope.toggleProducts('event', 'exchange')
      expect(OrderCycle.toggleProducts).toHaveBeenCalledWith('event', 'exchange')

    it 'Adds order cycle suppliers', ->
      scope.new_supplier_id = 'new supplier id'
      scope.addSupplier('event')
      expect(OrderCycle.addSupplier).toHaveBeenCalledWith('event', 'new supplier id')

    it 'Submits the order cycle via OrderCycle update', ->
      scope.submit()
      expect(OrderCycle.update).toHaveBeenCalled()


describe 'OrderCycle services', ->


describe 'OrderCycle directives', ->
