/* SPDX-License-Identifier: GPL-2.0-only  */
/*
 * Copyright (C) 2018-2020 Oplus. All rights reserved.
 */

#pragma once

#include <aidl/vendor/lineage/oplus_als/BnAreaCapture.h>
#include <hardware/sensors.h>

class AlsCorrection {
  public:
    static void init();
    static void process(sensors_event_t& event);
};
