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
	description = "Solo paseaba.";
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_00"); //�Qu� quieres?
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
	description = "Quiero ver a los presos.";
};

func int DIA_Boltan_ToConvicts_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info ()
{
	AI_Output (other, self, "DIA_Boltan_Add_15_01"); //Quiero ver a los presos.
	
	
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		if (other.guild == GIL_SLD)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_07"); //S�, ve a despedirte de tu amigo.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_06"); //Hemos encerrado el cerdo que asesin� al palad�n Lothar.
		};
	}
	else if (Canthar_Ausgeliefert == FALSE)
	&& (Sarah_Ausgeliefert == FALSE)
	&& (Rengaru_Ausgeliefert == FALSE)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		AI_Output (self ,other, "DIA_Boltan_Add_05_02"); //Por ahora todas las celdas est�n vac�as.
	}
	else
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_04"); //De acuerdo, amigo.
		}
		else if (other.guild == GIL_PAL) || (other.guild == GIL_KDF)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_05"); //Naturalmente.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_03"); //Adelante, pero no te vayas mucho tiempo, �me oyes?
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_08"); //No habr�s venido a sacar a tu amigo, �eh?
	AI_Output (self ,other, "DIA_Boltan_Add_05_09"); //�Ni hablar! �En cuanto d� la alarma, los muchachos llegar�n en un instante!
	AI_Output (self ,other, "DIA_Boltan_Add_05_10"); //�Y entonces haremos picadillo a un mercenario! (risa maliciosa).
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_11"); //Eh, t� eres el tipo que se quej� del mercader Canthar.
	AI_Output (self ,other, "DIA_Boltan_Add_05_12"); //Hay mucha gente que responde de �l, gente respetable.
	AI_Output (self ,other, "DIA_Boltan_Add_05_13"); //Seguro que no ha sido m�s que un malentendido. Suele suceder.
	AI_Output (self ,other, "DIA_Boltan_Add_05_14"); //En el futuro, debes tener m�s cuidado con qui�n metes en la c�rcel.
};		















