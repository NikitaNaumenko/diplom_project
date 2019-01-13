<template>
  <div data-equalizer>
    <div>
      <div>
        <form>
          <div>
            <div>
              <div>
                <label> <input type="text" placeholder="id" /> </label>
              </div>
              <div>
                <label>
                  <input
                    type="text"
                    placeholder="value"
                    v-model="value"
                    id="value"
                    name="value"
                  />
                </label>
              </div>
              <div>
                <label>
                  <input
                    type="text"
                    placeholder="Label"
                    v-model="label"
                    id="label"
                    name="label"
                  />
                </label>
              </div>
              <div>
                <label>
                  <input
                    type="text"
                    placeholder="Icon"
                    v-model="icon"
                    id="icon"
                    name="icon"
                  />
                </label>
              </div>
            </div>

            <div class="addRowBtn" v-on:click.prevent="addRow" value="">
              <i class="fa fa-plus" aria-hidden="true"></i>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style></style>
