// ***************************************************
//  	B_SCObsession	(Bessenheit des SC durch einen Dementor oder dem Buch der Besessenen)	
// ***************************************************

var int SC_IsObsessed;
var int SC_ObsessionCounter;

/////////////////////////////
// B_ClearSCObsession	
/////////////////////////////

func void B_ClearSCObsession (VAR C_NPC heiler)	
{														
	if (Hlp_GetInstanceID(heiler) != Hlp_GetInstanceID(hero))
		{
			AI_StopProcessInfos	(heiler);
		};
		
	SC_IsObsessed = FALSE;
	SC_ObsessionCounter = 0;
	PrintScreen	(PRINT_ClearSCObsession, -1,-1,FONT_Screen,3);
};

/////////////////////////////
// B_SCIsObsessed	
/////////////////////////////

func void B_SCIsObsessed (VAR C_NPC dementor)	
{														
	if (Hlp_GetInstanceID(dementor) != Hlp_GetInstanceID(hero))
			{
				AI_StopProcessInfos	(dementor);
			};
	
	if (Npc_HasItems (hero,ItAm_Prot_BlackEye_Mis) == FALSE) //Joly: Schutzamulett gegen den Schwarzen Blick
	{
		if(SC_ObsessionCounter >= 2)	//Joly: drei mal mit Dementoren gesprochen und der SC ist besessen!
			{
				SC_IsObsessed = TRUE;
				PrintScreen	(PRINT_SCIsObsessed, -1,-1,FONT_Screen,2);
			};
		
		SC_ObsessionCounter = SC_ObsessionCounter +	1;
	};
};


