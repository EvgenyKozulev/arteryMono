#include "main.h"

#include "at32_emac.h"
#include "netconf.h"
void LedToggleThread(void *arg);
void hNetHelloThread(__attribute__((unused)) void *arg);

volatile uint32_t local_time = 0;

int main(void)
{
    nvic_priority_group_config(NVIC_PRIORITY_GROUP_4);
    system_clock_config();
    xTaskCreate(hNetHelloThread, "hNetTask", 512, NULL, 3, NULL);
    xTaskCreate(LedToggleThread, "LedTask", 128, NULL, 5, NULL);
    vTaskStartScheduler();
    while (1)
    {
        /* code */
    }

    return 0;
}

void hNetHelloThread(__attribute__((unused)) void *arg)
{
    while (emac_system_init() == ERROR)
        ;
    tcpip_stack_init();

    vTaskSuspend(NULL);
}

void LedToggleThread(__attribute__((unused)) void *arg)
{
    gpio_init_type gpio_init_struct;
    crm_periph_clock_enable(CRM_GPIOD_PERIPH_CLOCK, TRUE);
    gpio_default_para_init(&gpio_init_struct);
    gpio_init_struct.gpio_drive_strength = GPIO_DRIVE_STRENGTH_STRONGER;
    gpio_init_struct.gpio_out_type = GPIO_OUTPUT_PUSH_PULL;
    gpio_init_struct.gpio_mode = GPIO_MODE_OUTPUT;
    gpio_init_struct.gpio_pins = GPIO_PINS_13;
    gpio_init_struct.gpio_pull = GPIO_PULL_NONE;
    gpio_init(GPIOD, &gpio_init_struct);
    while (1)
    {
        GPIOD->odt ^= GPIO_PINS_13;
        vTaskDelay(500 / portTICK_PERIOD_MS);
    }
}

// void TMR6_DAC_GLOBAL_IRQHandler(void)
// {
//     if (tmr_flag_get(TMR6, TMR_OVF_FLAG) != RESET)
//     {
//         /* Update the local_time by adding SYSTEMTICK_PERIOD_MS each SysTick interrupt */
//         time_update();
//         tmr_flag_clear(TMR6, TMR_OVF_FLAG);
//     }
// }

void EMAC_IRQHandler(void)
{
    while (emac_received_packet_size_get() != 0)
    {
        lwip_pkt_handle();
    }
    /* clear the emac dma rx it pending bits */
    emac_dma_flag_clear(EMAC_DMA_RI_FLAG);
    emac_dma_flag_clear(EMAC_DMA_NIS_FLAG);
}

static u32_t _rand_value;
u32_t lwip_rand(void)
{
    _rand_value = _rand_value * 1103515245u + 12345u;
    return ((u32_t)(_rand_value >> 16u) % (32767u + 1u));
}