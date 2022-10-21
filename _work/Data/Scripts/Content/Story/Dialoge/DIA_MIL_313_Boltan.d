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
	description = "Je m'en allais.";
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_00"); //Que venez-vous faire ici ?
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
	description = "Je veux voir les prisonniers.";
};

func int DIA_Boltan_ToConvicts_Condition ()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info ()
{
	AI_Output (other, self, "DIA_Boltan_Add_15_01"); //Je veux voir le prisonnier.
	
	
	if (Kapitel == 3) 
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		if (other.guild == GIL_SLD)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_07"); //Oui, allez-y et dites au revoir à votre pote.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_06"); //On a emmené le porc coupable du meurtre de Lothar.
		};
	}
	else if (Canthar_Ausgeliefert == FALSE)
	&& (Sarah_Ausgeliefert == FALSE)
	&& (Rengaru_Ausgeliefert == FALSE)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		AI_Output (self ,other, "DIA_Boltan_Add_05_02"); //Toutes les cellules sont vides pour l'instant.
	}
	else
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_04"); //Très bien, mon pote.
		}
		else if (other.guild == GIL_PAL) || (other.guild == GIL_KDF)
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_05"); //Naturellement.
		}
		else
		{
			AI_Output (self ,other, "DIA_Boltan_Add_05_03"); //Allez-y mais ne restez pas très longtemps, compris ?
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_08"); //Vous n'êtes pas ici pour faire sortir votre pote de là, n'est-ce pas ?
	AI_Output (self ,other, "DIA_Boltan_Add_05_09"); //N'y pensez même pas ! Il me suffit de donner l'alerte pour que les gars soient là en un instant
	AI_Output (self ,other, "DIA_Boltan_Add_05_10"); //Et on fera de la chair à pâté de mercenaire ! (rire gras)
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
	AI_Output (self ,other, "DIA_Boltan_Add_05_11"); //Eh, vous êtes le type qui a porté plainte contre Canthar le marchand.
	AI_Output (self ,other, "DIA_Boltan_Add_05_12"); //Beaucoup de gens viennent ici se porter garant pour lui. Des gens respectés.
	AI_Output (self ,other, "DIA_Boltan_Add_05_13"); //Toute cette affaire doit être un malentendu. Ça arrive parfois.
	AI_Output (self ,other, "DIA_Boltan_Add_05_14"); //A l'avenir, vous devriez faire attention à qui vous envoyez en prison.
};		















