// ************************************************
// 						EXIT
// ************************************************
INSTANCE DIA_Boltan_EXIT   (C_INFO)
{
	npc         = Mil_313_Boltan;
	nr          = 999;
	condition   = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent   = TRUE;
	description = "Ich wollte gerade wieder gehen.";
};

FUNC INT DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Boltan_EXIT_Info()
{
	//AI_Output (other, self, "DIA_Boltan_Add_15_15"); //Ich wollte gerade wieder gehen.
	AI_StopProcessInfos (self);
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_HALLO		(C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Boltan_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_00"); //Was willst du hier?
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_ToConvicts		(C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 2;
	condition	= DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent 	= TRUE;
	description = "Ich will zu den Gefangenen...";
};

func int DIA_Boltan_ToConvicts_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info ()
{
	AI_Output (other, self, "DIA_Boltan_Add_15_01"); //Ich will zu den Gefangenen...
	
	
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		if (other.guild == GIL_SLD)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_07"); //Ja, geh nur, und verabschiede dich von deinem Kumpel.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_06"); //Wir haben das Schwein eingelocht, das den Mord am Paladin Lothar begangen hat.
		};
	}
	else if (Canthar_Ausgeliefert == FALSE)
	&& (Sarah_Ausgeliefert == FALSE)
	&& (Rengaru_Ausgeliefert == FALSE)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		AI_Output (self ,other, "DIA_Boltan_Add_05_02"); //Zur Zeit sind alle Zellen leer.
	}
	else
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_04"); //Alles klar, Kollege.
		}
		else if (other.guild == GIL_PAL) || (other.guild == GIL_KDF)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_05"); //Selbstverständlich.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_03"); //Geh nur, aber bleib nicht zu lange, klar?
		};
	};
};		
		
// ************************************************
// 					HalloBennet
// ************************************************
instance DIA_Boltan_HalloBennet (C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Boltan_HalloBennet_Condition ()
{
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_08"); //Du bist doch nicht etwas gekommen, um deinen Kumpel hier rauszuholen, oder?
	AI_Output (self ,other, "DIA_Boltan_Add_05_09"); //Das kannst du vergessen! Sobald ich Alarm schlage, sind die Jungs hier!
	AI_Output (self ,other, "DIA_Boltan_Add_05_10"); //Und dann gibt's Söldner-Hack! (lacht dreckig)
};		
	
// ************************************************
// 					HalloCanthar
// ************************************************
instance DIA_Boltan_HalloCanthar (C_INFO)
{
	npc			= Mil_313_Boltan;
	nr 			= 1;
	condition	= DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Boltan_HalloCanthar_Condition ()
{
	if ( (Kapitel != 3) || ( (Kapitel == 3) && ( (MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD) ) ) )
	&& (Canthar_WiederRaus == TRUE)
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info ()
{
	AI_Output (self ,other, "DIA_Boltan_Add_05_11"); //Du bist doch der Kerl, der Canthar den Händler angezeigt hat.
	AI_Output (self ,other, "DIA_Boltan_Add_05_12"); //Es waren jede Menge Leute hier, die sich für ihn verbürgt haben. Angesehene Leute.
	AI_Output (self ,other, "DIA_Boltan_Add_05_13"); //Die Sache war wohl ein Mißverständnis. Sowas kommt vor.
	AI_Output (self ,other, "DIA_Boltan_Add_05_14"); //Pass in Zukunft besser auf, wen du in den Knast bringst.
};		















