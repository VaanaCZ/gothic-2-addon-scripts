///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Bienvenido al monasterio de Innos, forastero.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Soy el hermano Pedro, humilde siervo de Innos y portero del sagrado monasterio.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //¿Qué necesitas?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "¡Ten una salchicha, hermano!";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //¡Ten una salchicha, hermano!
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //Me alegro de que te acordaras de mí. Por lo general, paso desapercibido.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Podrías darme otra salchicha.
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Ni hablar. No me sobran.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //Eh, una salchicha... nadie se dará cuenta. Te daré algo a cambio: sé dónde crecen unas cuantas ortigas de fuego.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Si se las llevas a Neoras, seguro que te da la llave de la biblioteca. ¿Qué te parece?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"De acuerdo, toma otra salchicha.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"No, ni hablar.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //De acuerdo, toma otra salchicha.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Vale. Al otro lado del puente, tanto a la izquierda como a la derecha, crecen unas cuantas ortigas de fuego.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //No, ni hablar.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Quieres estar a buenas con Gorax, ¿eh? Siempre pasa lo mismo con los novicios nuevos...
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Quiero entrar en el monasterio.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Quiero entrar en el monasterio.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Solo pueden entrar en el monasterio los siervos de Innos.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Si quieres rezarle a Innos, busca uno de los altares que hay junto a los caminos. Allí encontrarás la tranquilidad necesaria para orar.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"¿Qué tengo que hacer para que me admitan en el monasterio?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //¿Qué tengo que hacer para que me admitan en el monasterio?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //No puedes acceder al monasterio. Ya has elegido un camino.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Si quieres ser admitido en la Hermandad de Innos, debes aprender y obedecer las reglas del monasterio.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Además, los novicios nuevos tienen que entregar ofrendas a Innos.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Una oveja y 1000 monedas de oro.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //Eso es mucho oro.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //Sirve para indicar que comienzas una nueva vida como siervo de Innos. Cuando seas admitido, se te perdonarán todos tus pecados anteriores.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Y piensa que si decides convertirte en siervo de Innos no puedes volverte atrás.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Para convertirme en novicio del monasterio de Innos, necesito una oveja y una gran cantidad de dinero.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tengo esta estatuilla…";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Tengo esta estatuilla. Creo que la querían en el monasterio.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //¿Puedo entrar ahora?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //En fin, en este caso excepcional, puedes pasar a convertirte en novicio.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Pedro, el novicio, me ha dejado entrar en el monasterio porque llevaba la estatuilla perdida. Tengo que entregársela a alguien del monasterio."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //No te puedo dejar entrar ni con esta gema preciosa, lo siento.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Ya te has decidido por otro sendero. La puerta al monasterio está cerrada para ti.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Puedo entregarte a ti la estatuilla?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //¿Puedo entregarte a ti la estatuilla?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Pues claro, yo la cuidaré. Gracias por tu acto desinteresado.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿A qué normas os atenéis?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //¿A qué normas os atenéis?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos es el dios de la verdad y de la ley y, por lo tanto, no podemos mentir ni cometer delito alguno.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Si pecaras contra un hermano de la comunidad o robaras nuestras propiedades, pagarías una multa.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos también es el dios de la autoridad y el fuego.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Como novicio, debes demostrar obediencia y respeto a todos los magos del fuego.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Entiendo.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Además, los novicios tienen la obligación de realizar todos los trabajos del monasterio para bien de la comunidad.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Si estás preparado para atenerte a estas normas y tienes la ofrenda para Innos, estamos dispuestos a aceptarte como novicio en el monasterio.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Quiero convertirme en novicio.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Me lo pensaré un poco más.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Sí, quiero consagrar mi vida al servicio de Innos.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Quiero convertirme en novicio.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Ya has elegido tu camino. La senda de la magia te está vedada.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //¿Eso es de verdad lo que quieres hacer? Debes saber que después no podrás echarte atrás.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Veo que has traído la ofrenda. Si de veras estás dispuesto, ya puedes convertirte en novicio.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Sin embargo, una vez que tomes la decisión no hay vuelta atrás. ¡Medita con cuidado si éste es tu camino!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //No has traído la ofrenda.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Sí, quiero consagrar mi vida al servicio de Innos.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //En ese caso sé bienvenido, hermano. Te hago entrega de la llave de la puerta del monasterio.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Como muestra de que tomas esta decisión de manera libre, tienes que abrir la puerta y franquear el umbral.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Ya eres novicio. Ponte esta túnica, que indica tu pertenencia a la hermandad.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Cuando estés en el monasterio, ve a ver a Parlan. A partir de ahora atenderá tus necesidades.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //¿Me serán perdonados mis pecados?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Aún no. Habla con el maestro Parlan. Él te bendecirá y te absolverá de todo pecado.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Me lo pensaré un poco más.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Vuelve cuando estés preparado.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Háblame de la vida en el monasterio.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Háblame de la vida en el monasterio.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Vivimos en el monasterio para servir a Innos. Los novicios trabajamos y estudiamos las escrituras cuando tenemos oportunidad.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Los magos velan por nosotros y exploran las artes mágicas.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















