<template>
  <div id = 'app'>
    <h2 class='text-center'> 
      Expected Income
    </h2>

    <div class = 'form-group'>
      <h3> 
      Income
        <small>
          {{ income }}
        </small>
      </h3>
    </div> 

    <div class = 'form-group'>
      <label> 
        Amount
      </label>
      <input class = 'form-control' v-model='amount' placeholder = 'Amount' />
    </div> 

    <div class = 'form-group'>
      <label> 
        Period (months)
      </label>
      <input class = 'form-control' v-model='period' placeholder = '12' />
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      amount: '',
      period: ''
    }
  },
  computed: {
    income: function(){
      return +this.amount + +this.amount * 0.3 / 12 * +this.period
    }
  }

}
</script>
