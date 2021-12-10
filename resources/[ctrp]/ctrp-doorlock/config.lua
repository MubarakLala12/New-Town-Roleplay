CTRP = {}

CTRP.Doors = {
	
	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 13,
		size = 2
	},
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 13,
		size = 2
	},
	{
		objName = 'prop_gate_prison_01',
		objCoords = vector3(1799.237, 2616.303, 44.6),
		textCoords = vector3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 10,
		size = 2
	},

	--Entrance
	{
		textCoords = vector3(434.24, -981.94, 30.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = false,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = -90.0,
				objCoords = vector3(434.22, -981.38, 30.71),
			},
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 90.0,
				objCoords = vector3(434.23, -982.43, 30.71)
			}
		}
	},

	{
		textCoords = vector3(441.9, -999.25, 30.73),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = -180.0,
				objCoords = vector3(442.36, -999.26, 30.73),
			},
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 360.0,
				objCoords = vector3(441.37, -999.26, 30.73)
			}
		}
	},

	{
		textCoords = vector3(457.06, -971.75, 30.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = -180.0,
				objCoords = vector3(457.64, -971.74, 30.71),
			},
			{
				objName = 'gabz_mrpd_reception_entrancedoor',
				objYaw = 360.0,
				objCoords = vector3(456.47, -971.73, 30.71)
			}
		}
	},

	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 6.0,
		size = 2
	},

	--parking

	{
		objName = 'gabz_mrpd_room13_parkingdoor',
		objYaw = 270.0,
		objCoords  = vector3(464.62, -975.65, 26.27),
		textCoords = vector3(464.62, -975.65, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_room13_parkingdoor',
		objYaw = -270.0,
		objCoords  = vector3(464.64, -996.48, 26.27),
		textCoords = vector3(464.64, -996.48, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	--cells

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = -360.0,
		objCoords  = vector3(485.97, -1011.75, 26.27),
		textCoords = vector3(485.97, -1011.75, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = -360.0,
		objCoords  = vector3(483.0, -1011.71, 26.27),
		textCoords = vector3(483.0, -1011.71, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = -360.0,
		objCoords  = vector3(479.98, -1011.75, 26.27),
		textCoords = vector3(479.98, -1011.75, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = -360.0,
		objCoords  = vector3(476.94, -1011.75, 26.27),
		textCoords = vector3(476.94, -1011.75, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = 180.0,
		objCoords  = vector3(484.97, -1008.2, 26.27),
		textCoords = vector3(484.97, -1008.2, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = 180.0,
		objCoords  = vector3(481.87, -1003.68, 26.27),
		textCoords = vector3(481.87, -1003.68, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_cells_door',
		objYaw = -90.0,
		objCoords  = vector3(476.2, -1007.92, 26.27),
		textCoords = vector3(476.2, -1007.92, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		textCoords = vector3(470.88, -1008.99, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_door_02',
				objYaw = -90.0,
				objCoords = vector3(470.85, -1008.42, 26.27),
			},
			{
				objName = 'gabz_mrpd_door_02',
				objYaw = 90.0,
				objCoords = vector3(470.85, -1009.58, 26.27)
			}
		}
	},

	{
		textCoords = vector3(468.72, -1001.06, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'gabz_mrpd_door_01',
				objYaw = -360.0,
				objCoords = vector3(468.13, -1001.07, 26.27),
			},
			{
				objName = 'gabz_mrpd_door_01',
				objYaw = 180.0,
				objCoords = vector3(469.32, -1001.07, 26.27)
			}
		}
	},

	{
		objName = 'gabz_mrpd_door_05',
		objYaw = -180.0,
		objCoords  = vector3(441.47, -985.68, 30.69),
		textCoords = vector3(441.47, -985.68, 30.69),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_door_04',
		objYaw = 360.0,
		objCoords  = vector3(441.41, -978.08, 30.69),
		textCoords = vector3(441.41, -978.08, 30.69),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_door_03',
		objYaw = 90.0,
		objCoords  = vector3(463.85, -983.65, 43.69),
		textCoords = vector3(463.85, -983.65, 43.69),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},

	{
		objName = 'gabz_mrpd_door_03',
		objYaw = -225.0,
		objCoords  = vector3(475.55, -989.54, 26.27),
		textCoords = vector3(475.55, -989.54, 26.27),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	
	-- Bureau Paleto Bay
	{
		textCoords = vector3(-435.57, 6008.76, 27.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor002',
				objYaw = -135.0,
				objCoords = vector3(-436.5157, 6007.844, 28.13839),
			},
			{
				objName = 'v_ilev_ph_gendoor002',
				objYaw = 45.0,
				objCoords = vector3(-434.6776, 6009.681, 28.13839)
			}
		}
	},
	-- Achterdeur links
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 135.0,
		objCoords  = vector3(-450.9664, 6006.086, 31.99004),
		textCoords = vector3(-451.38, 6006.55, 31.84),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Achterdeur rechts
	{
		objName = 'v_ilev_rc_door2',
		objYaw = -45.0,
		objCoords  = vector3(-447.2363, 6002.317, 31.84003),
		textCoords = vector3(-446.77, 6001.84, 31.68),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Kleedkamer
	{
		objName = 'v_ilev_rc_door2',
		objYaw = -45.0,
		objCoords  = vector3(-450.7136, 6016.371, 31.86523),
		textCoords = vector3(-450.15, 6015.96, 31.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Kleedkamer 2
	{
		objName = 'v_ilev_rc_door2',
		objYaw = 45.0,
		objCoords  = vector3(-454.0435, 6010.243, 31.86106),
		textCoords = vector3(-453.56, 6010.73, 31.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Wapenkamer
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -135.0,
		objCoords  = vector3(-439.1576, 5998.157, 31.86815),
		textCoords = vector3(-438.64, 5998.51, 31.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Verhoorkamer
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 45.0,
		objCoords  = vector3(-436.6276, 6002.548, 28.14062),
		textCoords = vector3(-437.09, 6002.100, 27.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Entree cellen 1
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vector3(-438.228, 6006.167, 28.13558),
		textCoords = vector3(-438.610, 6005.64, 27.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Entree cellen 2
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vector3(-442.1082, 6010.052, 28.13558),
		textCoords = vector3(-442.55, 6009.61, 27.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Cel
	{
		objName = 'v_ilev_ph_cellgate1',
		objYaw = 45.0,
		objCoords  = vector3(-444.3682, 6012.223, 28.13558),
		textCoords = vector3(-444.77, 6011.74, 27.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
	},
	-- Gang lockers (dubbele deuren)
	{
		textCoords = vector3(-442.09, 6011.93, 31.86523),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 225.0,
				objCoords  = vector3(-441.0185, 6012.795, 31.86523),
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 45.0,
				objCoords  = vector3(-442.8578, 6010.958, 31.86523)
			}
		}
	},
	-- Gang naar achterkant (dubbele deuren)
	{
		textCoords = vector3(-448.67, 6007.52, 31.86523),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 135.0,
				objCoords = vector3(-447.7283, 6006.702, 31.86523),
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = -45.0,
				objCoords = vector3(-449.5656, 6008.538, 31.86523)
			}
		}
	},


	-- Pillbox Medical Center

{
    textCoords = vector3(348.56, -587.38, 44.28),
    authorizedJobs = { 'doctor' },
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = 250.0,
            objCoords  = vector3(349.134, -586.8831, 43.28402)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -110.0,
            objCoords  = vector3(348.6142, -588.1655, 43.28402)
        }
    }
},

{
    objName = 'gabz_pillbox_singledoor',
    objCoords = vector3(308.5733, -597.5756, 43.28403),
    textCoords = vector3(308.5733, -597.5756, 43.28403),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2
},

{
    objName = 'gabz_pillbox_singledoor',
    objCoords = vector3(340.1134, -586.6057, 44.28398),
    textCoords = vector3(340.1134, -586.6057, 44.28398),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2
},

{
    objName = 'gabz_pillbox_singledoor',
    objCoords = vector3(347.45, -584.61, 43.28),
    textCoords = vector3(347.45, -584.61, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = false,
    distance = 2.0,
    size = 2
},

{
    objName = 'gabz_pillbox_singledoor',
    objCoords = vector3(341.49, -582.27, 43.28),
    textCoords = vector3(341.49, -582.27, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2
},

{
    objName = 'gabz_pillbox_singledoor',
    objCoords = vector3(336.85, -580.26, 43.28),
    textCoords = vector3(336.85, -580.26, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = false,
    distance = 2.0,
    size = 2
},

----Pillbox Entrance 
{
    textCoords = vector3(303.91, -581.80, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = false,
    pickable = false,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = -20.0,
            objCoords  = vector3(303.51, -581.64, 43.28)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -20.0,
            objCoords  = vector3(304.46, -582.26, 43.28)
        }
    }
},

-- Pillbox Surgery #1
{
    textCoords = vector3(313.35, -571.63, 44.29),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = -20.0,
            objCoords  = vector3(312.7201, -571.6296, 43.28402)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -20.0,
            objCoords  = vector3(313.8816, -571.9534, 43.28402)
        }
    }
},

{
    textCoords = vector3(326.55, -579.42, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = 250.0,
            objCoords  = vector3(326.54, -578.91, 43.28402)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = 250.0,
            objCoords  = vector3(326.54, -580.04, 43.28402)
        }
    }
},

{
    textCoords = vector3(325.55, -589.02, 43.28),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = -20.0,
            objCoords  = vector3(324.91, -589.02, 43.28)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -20.0,
            objCoords  = vector3(326.16, -589.02, 43.28)
        }
    }
},

-- Pillbox Surgery #2

{
    textCoords = vector3(319.2, -573.24, 44.29),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = -20.0,
            objCoords  = vector3(318.4946, -573.7322, 43.28399)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -20.0,
            objCoords  = vector3(319.6151, -574.2166, 43.28405)
        }
    }
},

{
    textCoords = vector3(324.44, -575.64, 44.29),
    authorizedJobs = { 'doctor'},
    locking = false,
    locked = true,
    pickable = true,
    distance = 2.0,
    size = 2,
    doors = {
        {
            objName = 'gabz_pillbox_doubledoor_l',
            objYaw = -20.0,
            objCoords  = vector3(323.8446, -575.741, 43.284)
        },

        {
            objName = 'gabz_pillbox_doubledoor_r',
            objYaw = -20.0,
            objCoords  = vector3(325.0642, -576.1204, 43.284)
        }
    }
},

	--
	-- Bolingbroke Penitentiary
	--
	--[[Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 13,
		size = 2
	},
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 13,
		size = 2
	},
	{
		objName = 'prop_gate_prison_01',
		objCoords = vector3(1799.237, 2616.303, 44.6),
		textCoords = vector3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 10,
		size = 2
	},]]


	--outside doors
	{
		objName = 'prop_fnclink_03gate5',
		objCoords = vector3(1796.322, 2596.574, 45.565),
		textCoords = vector3(1796.322, 2596.574, 45.965),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vector3(1821.677, 2477.265, 45.945),
		textCoords = vector3(1821.677, 2477.265, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vector3(1760.692, 2413.251, 45.945),
		textCoords = vector3(1760.692, 2413.251, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vector3(1543.58, 2470.252, 45.945),
		textCoords = vector3(1543.58, 2470.25, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vector3(1659.733, 2397.475, 45.945),
		textCoords = vector3(1659.733, 2397.475, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vector3(1537.731, 2584.842, 45.945),
		textCoords = vector3(1537.731, 2584.842, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vector3(1571.964, 2678.354, 45.945),
		textCoords = vector3(1571.964, 2678.354, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vector3(1650.18, 2755.104, 45.945),
		textCoords = vector3(1650.18, 2755.104, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vector3(1771.98, 2759.98, 45.945),
		textCoords = vector3(1771.98, 2759.98, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vector3(1845.7, 2699.79, 45.945),
		textCoords = vector3(1845.7, 2699.79, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vector3(1820.68, 2621.95, 45.945),
		textCoords = vector3(1820.68, 2621.95, 45.945),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		size = 2
	},
	--
	-- Bolingbroke Extra
	--
	-- To Offices
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vector3(1819.129, 2593.64, 46.09929),
		textCoords = vector3(1843.3, 2579.39, 45.98),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},

	-- To Changingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 360.0,
		objCoords  = vector3(1827.365, 2587.547, 46.09929),
		textCoords = vector3(1835.76, 2583.15, 45.95),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	-- To CrimChangingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vector3(1826.466, 2585.271, 46.09929),
		textCoords = vector3(1835.77, 2589.76, 45.95),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.0,
		size = 2
	},
	-- To CheckingRoom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(1827.521, 2583.905, 45.28576),
		textCoords = vector3(1828.638, 2584.675, 45.95233),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	-- Checking Gate
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 270.0,
		objCoords  = vector3(1837.714, 2595.185, 46.09929),
		textCoords = vector3(1837.714, 2595.185, 46.09929),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- To CheckingRoomFromCheck
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vector3(1837.697, 2585.24, 46.09929),
		textCoords = vector3(1837.697, 2585.24, 46.09929),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- To SecondCheckGate

	-- 58
	-- X:1845.198 Y:2585.24 Z:46.09929
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vector3(1845.198, 2585.24, 46.09929),
		textCoords = vector3(1845.198, 2585.24, 46.09929),
		authorizedJobs = { 'police' },
		locking = false,
		locked = false,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- To MainHall
	{
		objName = 'v_ilev_ph_door002',
		objYaw = 90.0,
		objCoords  = vector3(1791.18, 2593.11, 546.15),
		textCoords = vector3(1791.18, 2593.11, 546.15),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	-- To VisitorRoom
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vector3(1784, 2599, 46),
		textCoords = vector3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vector3(1786, 2600, 46),
		textCoords = vector3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		textCoords = vector3(1785.83, 2609.59, 45.99),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 182.0,
				objCoords = vector3(1785, 2610, 46),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 0.0,
				objCoords = vector3(1787, 2610, 46),
			}
		}
	},
	{
		textCoords = vector3(1779.67, 2601.83, 50.71),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 1.5,
				objCoords = vector3(1781, 2602, 51),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 180.0,
				objCoords = vector3(1778, 2602, 51),
			}
		}
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vector3(1780, 2596, 51),
		textCoords = vector3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vector3(1787, 2621, 46),
		textCoords = vector3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 270.0,
		objCoords  = vector3(1788, 2606, 51),
		textCoords = vector3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		textCoords = vector3(1791.08, 2593.76, 46.18),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 272.0,
				objCoords = vector3(1791.1140136719, 2592.50390625, 46.3132473297119),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 90.0,
				objCoords = vector3(1791, 2595, 46),
			}
		}
	},
	-- To DoctorRoom
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = 90.0,
		objCoords  = vector3(1786.4, 2579.8, 45.97),
		textCoords = vector3(1786.4, 2579.8, 45.97),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.0,
		size = 2
	},
	-- HallGate
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vector3(1786, 2567, 46),
		textCoords = vector3(1778.91, 2568.91, 46.07),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	-- HallGate 2
	{
		objName = 'prison_prop_door1',
		objYaw = 270.0,
		objCoords  = vector3(1792, 2551, 46),
		textCoords = vector3(1773.49, 2568.9, 46.07),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		textCoords = vector3( 1781.72, 2552.07, 49.57),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 269.5,
				objCoords = vector3(1782, 2551, 50),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 90.0,
				objCoords = vector3(1782, 2553, 50),
			}
		}
	},
	-- Gate To Work
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vector3(1786, 2552, 50),
		textCoords = vector3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	-- Cell Maindoor
	{
		objName = 'prison_prop_door2',
		objYaw = 180.0,
		objCoords  = vector3(1785, 2550, 46),
		textCoords = vector3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	{
		objName = 'prison_prop_door1a',
		objYaw = 270.0,
		objCoords  = vector3(1776, 2551, 46),
		textCoords = vector3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2
	},
	----------------
	-- Pacific Bank
	----------------
	-- First Door
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vector3(257.41, 220.25, 106.4),
		textCoords = vector3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Second Door
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vector3(261.83, 221.39, 106.41),
		textCoords = vector3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- Office to gate door
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vector3(265.19, 217.84, 110.28),
		textCoords = vector3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},

	-- First safe Door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vector3(252.98, 220.65, 101.8),
		textCoords = vector3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police' },
		objYaw = 160.0,
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- Second safe Door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vector3(261.68, 215.62, 101.81),
		textCoords = vector3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},

	----------------
	-- Fleeca Banks
	----------------
	-- Door 1
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vector3(314.61, -285.82, 54.49),
		textCoords = vector3(313.3, -285.45, 54.49),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Door 2
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vector3(148.96, -1047.12, 29.7),
		textCoords = vector3(148.96, -1047.12, 29.7),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Door 3
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vector3(-351.7, -56.28, 49.38),
		textCoords = vector3(-351.7, -56.28, 49.38),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Door 4
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vector3(-2956.18, -335.76, 38.11),
		textCoords = vector3(-2956.18, -335.76, 38.11),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Door 5
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vector3(-2956.18, 483.96, 16.02),
		textCoords = vector3(-2956.18, 483.96, 16.02),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = true,
		distance = 1.5,
		size = 2
	},
	-- Paleto Door 1
	{
		objName = 'v_ilev_cbankvaulgate01',
		objCoords  = vector3(-105.77, 6472.59, 31.81),
		textCoords = vector3(-105.77, 6472.59, 31.81),
		objYaw = 45.0,
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-- Paleto Door 2
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = vector3(-106.26, 6476.01, 31.98),
		textCoords = vector3(-105.5, 6475.08, 31.99),
		objYaw = -45.0,
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1.5,
		size = 2
	},
	-----
	-- Police front gate
	-----

	-----


--Bahmas
{
	textCoords = vector3(-1395.13, -595.35, 30.32),
	authorizedJobs = { 'bahamas' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'v_ilev_ph_gendoor006',
			objYaw = 31.0,
			objCoords = vector3(-1394.58, -595.01, 30.32),
		},

		{
			objName = 'v_ilev_ph_gendoor006',
			objYaw = -145.0,
			objCoords = vector3(-1395.75, -595.58, 30.32),
		}
	}
},

{
	textCoords = vector3(-1392.41, -592.03, 30.32),
	authorizedJobs = { 'bahamas' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'v_ilev_ph_gendoor006',
			objYaw = -59.0,
			objCoords = vector3(-1392.11, -592.48, 30.32),
		},

		{
			objName = 'v_ilev_ph_gendoor006',
			objYaw = 125.0,
			objCoords = vector3(-1392.64, -591.49, 30.32),
		}
	}
},


{
	textCoords = vector3(-1388.26, -587.04, 30.22),
	authorizedJobs = { 'bahamas' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'bahama_door_l',
			objYaw = 33.0,
			objCoords = vector3(-1387.68, -586.48, 30.21),
		},

		{
			objName = 'bahama_door_r',
			objYaw = -147.0,
			objCoords = vector3(-1388.73, -587.2, 30.21),
		}
	}
},

--[[comedy club
{
	textCoords = vector3(-430.11, 261.66, 83.0),
	authorizedJobs = { 'comclub' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'v_ilev_csr_door_l',
			objYaw = -10.0,
			objCoords = vector3(-430.52, 261.72, 83.0),
		},

		{
			objName = 'v_ilev_csr_door_r',
			objYaw = 0.0,
			objCoords = vector3(-429.66, 261.57, 83.01),
		}
	}
},

{
	objName = 'v_ilev_roc_door2',
	objCoords  = vector3(-432.33, 268.86, 83.02),
	textCoords = vector3(-432.33, 268.86, 83.02),
	authorizedJobs = { 'comclub' },
	locking = false,
	locked = true,
	pickable = true,
	distance = 1,
	size = 2
},

{
	textCoords = vector3(-433.62, 267.41, 83.02),
	authorizedJobs = { 'comclub' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 1.5,
	doors = {
		{
			objName = 'v_ilev_roc_door2',
			objYaw = 85.0,
			objCoords = vector3(-433.56, 266.88, 83.02),
		},

		{
			objName = 'v_ilev_roc_door2',
			objYaw = -95.0,
			objCoords = vector3(-433.39, 267.92, 83.02),
		}
	}
},

{
	objName = 'v_ilev_roc_door3',
	objCoords  = vector3(-445.09, 268.53, 83.02),
	textCoords = vector3(-445.09, 268.53, 83.02),
	authorizedJobs = { 'comclub' },
	locking = false,
	locked = true,
	pickable = true,
	distance = 1,
	size = 2
},

{
	objName = 'v_ilev_roc_door3',
	objCoords  = vector3(-435.54, 277.05, 83.02),
	textCoords = vector3(-435.54, 277.05, 83.02),
	authorizedJobs = { 'comclub' },
	locking = false,
	locked = true,
	pickable = true,
	distance = 1,
	size = 2
},]]

-- cinema
{
	textCoords = vector3(340.38, 179.41, 103.01),
	authorizedJobs = { 'cinema' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'v_ilev_csr_door_l',
			objYaw = -20.0,
			objCoords = vector3(339.87, 179.49, 103.01),
		},

		{
			objName = 'v_ilev_csr_door_r',
			objYaw = -20.0,
			objCoords = vector3(340.71, 179.16, 103.01),
		}
	}
},

{
	textCoords = vector3(335.7, 180.99, 103.01),
	authorizedJobs = { 'cinema' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 2.5,
	doors = {
		{
			objName = 'v_ilev_csr_door_l',
			objYaw = -20.0,
			objCoords = vector3(335.15, 181.04, 103.02),
		},

		{
			objName = 'v_ilev_csr_door_r',
			objYaw = -20.0,
			objCoords = vector3(336.14, 180.81, 103.01),
		}
	}
},
{
	objName = 'v_ilev_roc_door3',
	objCoords  = vector3(339.15, 182.32, 103.09),
	textCoords = vector3(339.15, 182.32, 103.09),
	authorizedJobs = { 'cinema' },
	locking = false,
	locked = true,
	pickable = true,
	distance = 1,
	size = 2
},
	



-- -- mechanic
-- {
-- 	objName = 'v_ilev_cor_darkdoor',
-- 	objCoords  = vector3(807.17, -878.63, 25.25),
-- 	textCoords = vector3(807.17, -878.63, 25.25),
-- 	authorizedJobs = { 'mechanic' },
-- 	locking = false,
-- 	locked = true,
-- 	pickable = false,
-- 	distance = 2,
-- 	size = 2
-- },
-- {
-- 	objName = 'v_ilev_rc_door2',
-- 	objCoords  = vector3(815.89, -888.36, 25.25),
-- 	textCoords = vector3(815.89, -888.36, 25.25),
-- 	authorizedJobs = { 'mechanic' },
-- 	locking = false,
-- 	locked = true,
-- 	pickable = false,
-- 	distance = 2,
-- 	size = 2
-- },

-- {
-- 	objName = 'v_ilev_rc_door2',
-- 	objCoords  = vector3(844.18, -902.46, 25.25),
-- 	textCoords = vector3(844.18, -902.46, 25.25),
-- 	authorizedJobs = { 'mechanic' },
-- 	locking = false,
-- 	locked = true,
-- 	pickable = false,
-- 	distance = 2,
-- 	size = 2
-- },

-- {
-- 	objName = 'v_ilev_rc_door2',
-- 	objCoords  = vector3(895.93, -896.56, 27.8),
-- 	textCoords = vector3(895.93, -896.56, 27.8),
-- 	authorizedJobs = { 'mechanic' },
-- 	locking = false,
-- 	locked = true,
-- 	pickable = false,
-- 	distance = 2,
-- 	size = 2
-- },

-- {
-- 	objName = 'prop_gate_airport_01',
-- 	objCoords  = vector3(854.8, -927.98, 26.28),
-- 	textCoords = vector3(854.8, -927.98, 26.28),
-- 	authorizedJobs = { 'mechanic' },
-- 	locking = false,
-- 	locked = true,
-- 	pickable = false,
-- 	distance = 10,
-- 	size = 2
-- },

----new-lscustoms
{
	objName = 'ajaxon_burton_lsc_side_door2',
	objCoords  = vector3(-372.05, -99.57, 39.13),			
	textCoords = vector3(-372.05, -99.57, 39.13),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 10.0,
	size = 2
},
{
	objName = 'ajaxon_burton_lsc_side_door2',
	objCoords  = vector3(-365.06, -102.21, 39.1),			
	textCoords = vector3(-365.06, -102.21, 39.1),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 10.0,
	size = 2
},
{
	objName = 'ajaxon_burton_lsc_front_door2',
	objCoords  = vector3(-349.84, -117.27, 39.02),			
	textCoords = vector3(-349.84, -117.27, 39.02),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 10.0,
	size = 2
},
{
	objName = 'ajaxon_burton_lsc_front_door2',
	objCoords  = vector3(-356.26, -134.82, 39.01),			
	textCoords = vector3(-356.26, -134.82, 39.01),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = false,
	pickable = false,
	distance = 10.0,
	size = 2
},


{
	objName = 'v_ilev_carmod3door',
	objCoords  = vector3(114.3135, 6623.233, 32.67305),			
	textCoords = vector3(114.48, 6623.08, 31.79),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 10.0,
	size = 2
},
{
	objName = 'v_ilev_carmod3door',
	objCoords  = vector3(108.8502, 6617.876, 32.67305),			
	textCoords = vector3(108.61, 6617.71, 31.79),
	authorizedJobs = { 'mechanic' },
	locking = false,
	locked = true,
	pickable = false,
	distance = 10.0,
	size = 2
},
	
	
	--pdm
	-- {
	-- 	textCoords = vector3(-38.34, -1108.98, 26.44),
	-- 	authorizedJobs = { 'pdm'},
	-- 	locking = false,
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 3.5,
	-- 	doors = {
	-- 		{
	-- 			objName = 'v_ilev_csr_door_r',
	-- 			objYaw = -20.0,
	-- 			objCoords = vector3(-38.01, -1109.14, 26.44)
	-- 		},

	-- 		{
	-- 			objName = 'v_ilev_csr_door_l',
	-- 			objYaw = -20.0,
	-- 			objCoords = vector3(-37.94, -1109.18, 26.44)
	-- 		}
	-- 	}
	-- },

	-- {
	-- 	textCoords = vector3(-60.66, -1093.7, 26.63),
	-- 	authorizedJobs = { 'pdm' },
	-- 	locking = false,
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 3.5,
	-- 	doors = {
	-- 		{
	-- 			objName = 'v_ilev_csr_door_r',
	-- 			objYaw = -110.0,
	-- 			objCoords = vector3(-60.85, -1094.17, 26.63)
	-- 		},

	-- 		{
	-- 			objName = 'v_ilev_csr_door_l',
	-- 			objYaw = -110.0,
	-- 			objCoords = vector3(-60.51, -1093.17, 26.63)
	-- 		}
	-- 	}
	-- },


	{
		objName = 'patoche_free_door1',
		objCoords  = vector3(-1238.15, -338.14, 37.35),
		textCoords = vector3(-1238.15, -338.14, 37.35),
		authorizedJobs = { 'pdm' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 7,
		size = 2
	},

		-----
	-- Luxury Cars
	-----
	-- Entrance Doors
	-- {
	-- 	textCoords = vector3(-803.0223, -223.8222, 37.87975),
	-- 	authorizedJobs = { 'edm' },
	-- 	locking = false,
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 3.5,
	-- 	doors = {
	-- 		{
	-- 			objName = 'door_1_l',
	-- 			objYaw = 30.0,
	-- 			objCoords = vector3(-803.0223, -222.5841, 37.87975)
	-- 		},

	-- 		{
	-- 			objName = 'door_1_r',
	-- 			objYaw = 30.0,
	-- 			objCoords = vector3(-801.9622, -224.5203, 37.87975)
	-- 		}
	-- 	}
	-- },
	-- -- Side Entrance Doors
	-- {
	-- 	textCoords = vector3(-777.1855, -244.0013, 37.333889),
	-- 	authorizedJobs = { 'edm' },
	-- 	locking = false,
	-- 	locked = true,
	-- 	pickable = false,
	-- 	distance = 3.5,
	-- 	doors = {
	-- 		{
	-- 			objName = 'door_2_l',
	-- 			objYaw = 110.0,
	-- 			objCoords = vector3(-778.1855, -244.3013, 37.33388)
	-- 		},

	-- 		{
	-- 			objName = 'door_2_r',
	-- 			objYaw = 110.0,
	-- 			objCoords = vector3(-776.1591, -243.5013, 37.33388)
	-- 		}
	-- 	}
	-- },
	--[[Garage Doors
	{
		textCoords = vector3(-768.1264, -238.9737, 37.43247),
		authorizedJobs = { 'edm' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 13.0,
		doors = {
			{
				objName = 'prop_autodoor',
				objCoords = vector3(-770.6311, -240.0069, 37.43247)
			},

			{
				objName = 'prop_autodoor',
				objCoords = vector3(-765.6217, -237.9405, 37.43247)
			}
		}
	},]]




	--MCD
	{
		textCoords = vector3(272.95, -965.57, 29.32),
		authorizedJobs = { 'mcd' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ch_glassdoor',
				objYaw = 35.0,
				objCoords = vector3(273.32, -965.21, 29.32),
			},
	
			{
				objName = 'v_ilev_ch_glassdoor',
				objYaw = -145.0,
				objCoords = vector3(272.36, -965.69, 29.31),
			}
		}
	},

	--coffeeshop
	{
		objName = 'v_ilev_ra_door2',
		objCoords  = vector3(-628.79, 229.37, 81.88),
		textCoords = vector3(-628.79, 229.37, 81.88),
		authorizedJobs = { 'coffee' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 3,
		size = 2
	},
	{
		objName = 'v_ilev_ra_door2',
		objCoords  = vector3(-632.67, 227.17, 81.88),
		textCoords = vector3(-632.67, 227.17, 81.88),
		authorizedJobs = { 'coffee' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},
	{
		textCoords = vector3(-627.57, 239.2, 81.89),
		authorizedJobs = { 'coffee' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_csr_door_l',
				objYaw = -90.0,
				objCoords = vector3(-627.6, 239.48, 81.89),
			},
	
			{
				objName = 'v_ilev_csr_door_r',
				objYaw = -92.0,
				objCoords = vector3(-627.63, 238.69, 81.89),
			}
		}
	},

	--mayor

	--[[{
		textCoords = vector3(-549.61, -195.96, 47.41),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = 210.0,
				objCoords = vector3(-549.26, -195.78, 47.41),
			},
	
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = -330.0,
				objCoords = vector3(-549.9, -196.16, 47.41),
			}
		}
	},

	{
		textCoords = vector3(-547.27, -191.89, 47.41),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = -60.0,
				objCoords = vector3(-547.5, -191.49, 47.41),
			},
	
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = 120.0,
				objCoords = vector3(-547.03, -192.52, 47.41),
			}
		}
	},

	
	{
		textCoords = vector3(-543.33, -191.67, 47.42),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = 210.0,
				objCoords = vector3(-542.91, -191.35, 47.42),
			},
	
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = -330.0,
				objCoords = vector3(-544.02, -191.95, 47.42),
			}
		}
	},

	{
		textCoords = vector3(-552.27, -191.25, 47.42),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = 210.0,
				objCoords = vector3(-551.79, -190.82, 47.42),
			},
	
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = -330.0,
				objCoords = vector3(-552.83, -191.44, 47.42),
			}
		}
	},

	{
		textCoords = vector3(-556.73, -206.11, 38.37),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = 120.0,
				objCoords = vector3(-556.34, -206.43, 38.37),
			},
	
			{
				objName = 'hei_prop_hei_bankdoor_new',
				objYaw = -420.0,
				objCoords = vector3(-556.89, -205.42, 38.37),
			}
		}
	},

	{
		objName = 'v_ilev_bk_door2',
		objCoords  = vector3(-537.15, -191.98, 38.22),
		textCoords = vector3(-537.15, -191.98, 38.22),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 3,
		size = 2
	},

	{
		objName = 'v_ilev_bk_door2',
		objCoords  = vector3(-542.51, -182.91, 38.22),
		textCoords = vector3(-542.51, -182.91, 38.22),
		authorizedJobs = { 'mayor', 'govem' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 3,
		size = 2
	},]]

	--cityhall

	{
		objName = 'ex_p_mp_door_apart_door_black',
		objCoords  = vector3(-1285.91, -585.27, 34.37),
		textCoords = vector3(-1285.91, -585.27, 34.37),
		authorizedJobs = { 'government' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'ex_p_mp_door_apart_door_black',
		objCoords  = vector3(-1290.35, -579.83, 34.37),
		textCoords = vector3(-1290.35, -579.83, 34.37),
		authorizedJobs = { 'Governor', 'Mayor', 'Secretery', 'Security Chief', 'State Treasure'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'ex_p_mp_door_apart_door_black',
		objCoords  = vector3(-1285.78, -585.21, 37.38),
		textCoords = vector3(-1285.78, -585.21, 37.38),
		authorizedJobs = { 'Secretery', 'Security Chief', 'State Security'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'ex_p_mp_door_apart_door_black',
		objCoords  = vector3(-1290.41, -579.81, 37.38),
		textCoords = vector3(-1290.41, -579.81, 37.38),
		authorizedJobs = { 'Mayor','Governor', 'State Treasure'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'ex_p_mp_door_apart_door_black',
		objCoords  = vector3(-1292.89, -569.22, 41.19),
		textCoords = vector3(-1292.89, -569.22, 41.19),
		authorizedJobs = { 'Governor', 'Secretery', 'State Treasure'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'fluorine4305_cityholl_secdoor',
		objCoords  = vector3(-1303.64, -570.61, 41.19),
		textCoords = vector3(-1303.64, -570.61, 41.19),
		authorizedJobs = { 'Governor'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 3,
		size = 2
	},

	--baba ka dhaba

	{
		objName = 'dinerdoor',
		objCoords  = vector3(-361.72, 275.48, 86.42),
		textCoords = vector3(-361.72, 275.48, 86.42),
		objYaw = -144.0,
		authorizedJobs = { 'dhaba'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'dinerdoor',
		objCoords  = vector3(-385.46, 270.08, 86.37),
		textCoords = vector3(-385.46, 270.08, 86.37),
		objYaw = -144.0,
		authorizedJobs = { 'dhaba'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},

	{
		objName = 'dinerdoor',
		objCoords  = vector3(-364.22, 278.99, 86.42),
		textCoords = vector3(-364.22, 278.99, 86.42),
		objYaw = -144.0,
		authorizedJobs = { 'dhaba'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		size = 2
	},
	
	--------Manson

	{
		textCoords = vector3(-1889.14, 2051.6, 141.01),
		authorizedJobs = { 'twisted', 'Chief', 'Commissioner'},
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objYaw = -20.0,
				objCoords = vector3(-1888.14, 2051.4, 141.01)
			},

			{
				objName = 'ball_prop_italy2',
				objYaw = 160.0,
				objCoords = vector3(-1890.14, 2051.4, 141.01)
			}
		}
	},
	{
		textCoords = vector3(-1886.53, 2050.60, 141.01),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objCoords = vector3(-1886.53, 2050.42, 141.01)
			},

			{
				objName = 'ball_prop_italy2',
				objCoords = vector3(-1885.53, 2049.8, 141.01)
			}
		}
	},
	{
		textCoords = vector3(-1860.3, 2054.20, 141.01),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objYaw = 180.0,
				objCoords = vector3(-1861.3, 2053.69, 141.01)
			},

			{
				objName = 'ball_prop_italy2',
				objYaw = 0.0,
				objCoords = vector3(-1859.3, 2053.69, 141.01)
			}
		}
	},
	{
		textCoords = vector3(-1874.41, 2070.06, 141.00),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objYaw = -20.0,
				objCoords = vector3(-1873.12, 2070.06, 141.00)
			},

			{
				objName = 'ball_prop_italy2',
				objYaw = 160.0,
				objCoords = vector3(-1875.45, 2070.06, 141.00)
			}
		}
	},
	{
		textCoords = vector3(-1885.85, 2074.21, 141.00),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objYaw = -20.0,
				objCoords = vector3(-1884.85, 2074.21, 141.00)
			},

			{
				objName = 'ball_prop_italy2',
				objYaw = 160.0,
				objCoords = vector3(-1886.85, 2074.21, 141.00)
			}
		}
	},
	{
		textCoords = vector3(-1893.51, 2075.49, 141.00),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy2',
				objYaw = -40.0,
				objCoords = vector3(-1892.51, 2075.49, 141.00)
			},

			{
				objName = 'ball_prop_italy2',
				objYaw = 140.0,
				objCoords = vector3(-1894.51, 2075.49, 141.00)
			}
		}
	},
	{
		textCoords = vector3(-1899.12, 2083.78, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = -40.0,
				objCoords = vector3(-1898.24, 2083.13, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = 140.0,
				objCoords = vector3(-1900.00, 2084.68, 140.40)
			}
		}
	},
	{
		textCoords = vector3(-1907.05, 2085.02, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = 50.0,
				objCoords = vector3(-1906.33, 2085.93, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = 230.0,
				objCoords = vector3(-1907.9, 2084.04, 140.40)
			}
		}
	},
	{
		textCoords = vector3(-1911.37, 2079.95, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = 50.0,
				objCoords = vector3(-1910.6, 2080.87, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = 230.0,
				objCoords = vector3(-1912.07, 2079.14, 140.40)
			}
		}
	},
	{
		textCoords = vector3(-1911.45, 2074.47, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = 140.0,
				objCoords = vector3(-1912.25, 2075.11, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = -40.0,
				objCoords = vector3(-1910.56, 2073.71, 140.40)
			}
		}
	},
	{
		textCoords = vector3(-1909.0, 2072.51, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = 140.0,
				objCoords = vector3(-1909.9, 2073.07, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = -40.0,
				objCoords = vector3(-1907.92, 2071.44, 140.40)
			}
		}
	},
	{
		textCoords = vector3(-1901.67, 2086.03, 140.40),
		authorizedJobs = { 'twisted' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'ball_prop_italy3',
				objYaw = -40.0,
				objCoords = vector3(-1900.67, 2085.31, 140.40)
			},

			{
				objName = 'ball_prop_italy3',
				objYaw = 140.0,
				objCoords = vector3(-1902.47, 2086.83, 140.40)
			}
		}
	},

	{
		textCoords = vector3(-560.56, 278.36, 82.98),
		authorizedJobs = { 'taq' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_roc_door1_l',
				objYaw = -5.0,
				objCoords = vector3(-560.83, 278.24, 82.98),
			},
	
			{
				objName = 'v_ilev_roc_door1_r',
				objYaw = -5.0,
				objCoords = vector3(-560.23, 278.12, 82.98),
			}
		}
	},

	{
		objName = 'v_ilev_roc_door5',
		objCoords  = vector3(-566.93, 291.53, 85.38),
		textCoords = vector3(-566.93, 291.53, 85.38),
		objYaw = 172.0,
		authorizedJobs = { 'taq' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},

	{
		textCoords = vector3(-593.42, 296.8, 94.92),
		authorizedJobs = { 'taq' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'apa_p_mp_yacht_door_02',
				objYaw = -96.0,
				objCoords = vector3(-593.31, 296.38, 94.92),
			},
	
			{
				objName = 'apa_p_mp_yacht_door_02',
				objYaw = 83.0,
				objCoords = vector3(-593.16, 297.21, 94.92),
			}
		}
	},

	-- mechanic
	{
		objName = 'v_ilev_cor_darkdoor',
		objCoords  = vector3(807.17, -878.63, 25.25),
		textCoords = vector3(807.17, -878.63, 25.25),
		authorizedJobs = { 'infimechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = vector3(815.89, -888.36, 25.25),
		textCoords = vector3(815.89, -888.36, 25.25),
		authorizedJobs = { 'infimechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = vector3(844.18, -902.46, 25.25),
		textCoords = vector3(844.18, -902.46, 25.25),
		authorizedJobs = { 'infimechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = vector3(895.93, -896.56, 27.8),
		textCoords = vector3(895.93, -896.56, 27.8),
		authorizedJobs = { 'infimechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},

	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(854.8, -927.98, 26.28),
		textCoords = vector3(854.8, -927.98, 26.28),
		authorizedJobs = { 'infimechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 10,
		size = 2
	},



}
