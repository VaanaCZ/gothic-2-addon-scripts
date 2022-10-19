//***********************************************************************
//	Info EXIT 
//***********************************************************************
INSTANCE DIA_Babo_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//***********************************************************************
//	Info Hello 
//***********************************************************************
INSTANCE DIA_Babo_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Babo_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (other.guild == GIL_NOV)
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Hello_Info()
{
	
	
	AI_Output (self ,other,"DIA_Babo_Hello_03_00"); //(Con timidez) Hola, tú también eres nuevo, ¿verdad?
	AI_Output (other,self ,"DIA_Babo_Hello_15_01"); //Sí. ¿Hace cuánto tiempo que estás aquí?
	AI_Output (self ,other,"DIA_Babo_Hello_03_02"); //Llevo aquí cuatro semanas. ¿Te han dado ya un bastón de combate?
	AI_Output (other,self ,"DIA_Babo_Hello_15_03"); //Por ahora, no.
	AI_Output (self ,other,"DIA_Babo_Hello_03_04"); //Entonces toma este. Todos los novicios llevamos uno, como símbolo de nuestra capacidad para defendernos. ¿Sabes luchar?
	AI_Output (other,self ,"DIA_Babo_Hello_15_05"); //Bueno, he empuñado un arma o dos...
	AI_Output (self ,other,"DIA_Babo_Hello_03_06"); //Si quieres, te puedo enseñar algo. Pero tengo algo que pedirte...

	B_GiveInvItems (self,other,ITMW_1h_NOV_Mace,1);
	AI_EquipBestMeleeWeapon (self);
	
};
//***********************************************************************
//	Info Anliegen
//***********************************************************************
INSTANCE DIA_Babo_Anliegen   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent   = FALSE;
	description	= "¿Qué es lo que quieres?";
};
FUNC INT DIA_Babo_Anliegen_Condition()
{
	if  (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Babo_Hello))
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Anliegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_00"); //¿Qué es lo que quieres?
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_01"); //Bueno, uno de los paladines, Sergio, está en estos momentos en el monasterio.
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_02"); //Si puedes convencerlo de que se ejercite conmigo, te entrenaré.
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_03"); //Veré qué se puede hacer.
	
	Log_CreateTopic (Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboTrain,LOG_RUNNING);
	B_LogEntry (Topic_BaboTrain,"Si puedo convencer a Sergio, el paladín, de que practique un poco con Babo, éste me enseñará a luchar con armas a dos manos.");
	
};
//***********************************************************************
//	Info Sergio
//***********************************************************************
INSTANCE DIA_Babo_Sergio   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent   = FALSE;
	description	= "He hablado con Sergio.";
};
FUNC INT DIA_Babo_Sergio_Condition()
{
	if Npc_KnowsInfo (other, DIA_Sergio_Babo)
	&& (other.guild == GIL_NOV)
	
	
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Sergio_Info()
{
	AI_Output (other,self ,"DIA_Babo_Sergio_15_00"); //He hablado con Sergio. Entrenará contigo todas las mañanas a partir de las cinco, durante dos horas.
	AI_Output (self ,other,"DIA_Babo_Sergio_03_01"); //¡Gracias! ¡Es todo un honor!
	AI_Output (self ,other,"DIA_Babo_Sergio_03_02"); //Si quieres, te enseñaré los secretos del combate.
	
	Babo_TeachPlayer = TRUE;	
	Babo_Training = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry (Topic_KlosterTeacher,"Babo me puede entrenar en el combate con armas a dos manos.");
};
//***************************************************************************************
//			Ich will trainieren
//***************************************************************************************
INSTANCE DIA_Babo_Teach(C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 100;
	condition	= DIA_Babo_Teach_Condition;
	information	= DIA_Babo_Teach_Info;
	permanent	= TRUE;
	description = "Estoy listo para el entrenamiento.";
};                       
//----------------------------------
var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;
//----------------------------------
FUNC INT DIA_Babo_Teach_Condition()
{
	if ((Babo_TeachPlayer == TRUE)
	&& (DIA_Babo_Teach_permanent == FALSE))
	|| (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
 
// -------------------------------
var int  babo_merk2h;
// -------------------------------
FUNC VOID DIA_Babo_Teach_Info()
{	
	babo_merk2h = other.HitChance [NPC_TALENT_2H]; 
	
	AI_Output (other,self ,"DIA_Babo_Teach_15_00"); //Estoy listo para el entrenamiento.
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);

};
FUNC VOID DIA_Babo_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output (self,other,"DIA_DIA_Babo_Teach_Back_03_00"); //Has aprendido todo lo que te puedo enseñar acerca del combate con armas a dos manos.
		
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Babo_Teach);
};

FUNC VOID DIA_Babo_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_00"); //Lucha por Innos. Innos es nuestra vida y la fe te da fuerza.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_01"); //Un siervo de Innos nunca provoca a un oponente, ¡lo sorprende!
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_02"); //Dondequiera que vayas, lleva siempre contigo tu bastón.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_03"); //Un siervo de Innos siempre está preparado para el combate. Si no dispones de magia, tu bastón es tu defensa principal.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};

FUNC VOID DIA_Babo_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_00"); //Un siervo de Innos no solo lucha con su bastón, también con su corazón.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_01"); //Tienes que saber cuándo te puedes retirar.
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_02"); //Recuerda: luchas bien si controlas a tu oponente y no le das la oportunidad de que mantenga el control.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_03"); //Solo eres derrotado cuando abandonas.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Babo_Wurst(C_INFO)
{
	npc         = NOV_612_Babo;
	nr			= 2;
	condition	= DIA_Babo_Wurst_Condition;
	information	= DIA_Babo_Wurst_Info;
	permanent	= FALSE;
	description = "Toma un poco de embutido.";
};                       

FUNC INT DIA_Babo_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Babo_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Babo_Wurst_15_00"); //Toma una salchicha.
	AI_Output (self, other, "DIA_Babo_Wurst_03_01"); //Oh, salchichas de cordero, ¡estupendo! Están de muerte. Vamos, ¡dame otra!
	AI_Output (other, self, "DIA_Babo_Wurst_15_02"); //Entonces no tendría para los demás.
	AI_Output (self, other, "DIA_Babo_Wurst_03_03"); //De todas maneras te sobra una. Me refiero a la que es para ti. ¿Y qué es una salchicha cuando hablamos de amistad?
	AI_Output (self, other, "DIA_Babo_Wurst_03_04"); //Vamos, te daré a cambio un pergamino del conjuro ''flecha de fuego''.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Babo_Wurst);
	Info_AddChoice (DIA_Babo_Wurst,"De acuerdo, toma otro.",DIA_Babo_Wurst_JA);
	Info_AddChoice (DIA_Babo_Wurst,"No, no lo haré.",DIA_Babo_Wurst_NEIN);
};
FUNC VOID DIA_Babo_Wurst_JA()
{
	AI_Output (other, self, "DIA_Babo_Wurst_JA_15_00"); //De acuerdo, toma otra.
	AI_Output (self, other, "DIA_Babo_Wurst_JA_03_01"); //Vale. Toma tu pergamino.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	B_GiveInvItems (self, other, ItSC_Firebolt, 1);
	
	Info_ClearChoices (DIA_Babo_Wurst);
};
FUNC VOID DIA_Babo_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Babo_Wurst_NEIN_15_00"); //No, no lo haré.
	AI_Output (self, other, "DIA_Babo_Wurst_NEIN_03_01"); //Chico, eres uno de esos que se lo toma todo en serio, ¿eh?
	Info_ClearChoices (DIA_Babo_Wurst);
};
//***********************************************************************
//	Was ist zwischen dir und Agon passiert? 
//***********************************************************************

INSTANCE DIA_Babo_YouAndAgon   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent   = FALSE;
	description	= "¿Qué pasó entre tú y Agon?";
};

FUNC INT DIA_Babo_YouAndAgon_Condition()
{
	if Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Babo_YouAndAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_YouAndAgon_15_00"); //¿Qué pasó entre tú y Agon?
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_01"); //¡Oh!, no nos pusimos de acuerdo sobre cómo cuidar las ortigas de fuego.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_02"); //Agon las regaba tanto que las plantas casi se pudrieron hasta la raíz.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_03"); //Cuando se pudrieron del todo, me echó la culpa a mí.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_04"); //Desde entonces me tienen todo el día barriendo el patio.
};
//***********************************************************************
//	Warum hat Agon das getan?
//***********************************************************************
INSTANCE DIA_Babo_WhyDidAgon  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 4;
	condition   = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent   = FALSE;
	description	= "¿Por qué hizo eso?";
};
FUNC INT DIA_Babo_WhyDidAgon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_WhyDidAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_WhyDidAgon_15_00"); //¿Por qué hizo eso?
	AI_Output (self ,other,"DIA_Babo_WhyDidAgon_03_01"); //Tendrás que preguntárselo a él. Creo que su problema es que no puede aceptar que alguien sea mejor que él.
};
//***********************************************************************
//	Du hast wohl Ahnung von Pflanzen?
//***********************************************************************
INSTANCE DIA_Babo_PlantLore  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 5;
	condition   = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent   = FALSE;
	description	= "Parece que sabes algo de las plantas.";
};
FUNC INT DIA_Babo_PlantLore_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_PlantLore_Info()
{
	AI_Output (other,self ,"DIA_Babo_PlantLore_15_00"); //Parece que sabes algo de las plantas.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_01"); //Teníamos un jardín y aprendí unos cuantos trucos de mi abuelo.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_02"); //Lo cierto es que preferiría volver a trabajar en el jardín.
	
	MIS_HelpBabo = LOG_RUNNING;
	Log_CreateTopic (Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboGaertner,LOG_RUNNING);
	B_LogEntry (Topic_BaboGaertner,"Babo prefiere trabajar en el jardín a barrer el patio.");
};
//***********************************************************************
//	Fegen
//***********************************************************************
INSTANCE DIA_Babo_Fegen  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent   = FALSE;
	description	= "Se supone que tengo que barrer las cámaras de los novicios.";
};
FUNC INT DIA_Babo_Fegen_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Fegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Fegen_15_00"); //Se supone que tengo que barrer las cámaras de los novicios.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_01"); //Tienes un montón de trabajo. ¿Sabes qué? Te ayudaré. Solo, nunca acabarías.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_02"); //Pero de verdad que necesito un pergamino de ''puño del viento''. ¿Sabes? Tuve suerte y me dejaron leer un libro que lo describía.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_03"); //Y, ahora, por supuesto, quiero probar el conjuro. Así que si me consigues el pergamino del conjuro, te ayudaré.
	
	B_LogEntry 	(Topic_ParlanFegen,"Babo me ayudará a barrer las alcobas de los novicios si le llevo un pergamino de puño del viento.");
};
//***********************************************************************
//	Windfaust abgeben
//***********************************************************************
INSTANCE DIA_Babo_Windfaust  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent   = TRUE;
	description	= "Acerca del pergamino de conjuro... (DAR PUÑO DEL VIENTO)";
};
//---------------------------------
var int DIA_Babo_Windfaust_permanent;
//---------------------------------
FUNC INT DIA_Babo_Windfaust_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Babo_Fegen))
	&& (DIA_Babo_Windfaust_permanent == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Windfaust_Info()
{
	AI_Output (other,self ,"DIA_Babo_Windfaust_15_00"); //Con respecto al pergamino de conjuro...
	AI_Output (self ,other,"DIA_Babo_Windfaust_03_01"); //¿Me has traído el conjuro puño del viento?
	
	if B_GiveInvItems (other, self, ItSc_Windfist,1)
	{ 
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_02"); //Toma, el pergamino que querías.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_03"); //Estupendo. Ahora te ayudaré a limpiar las alcobas.
		
		NOV_Helfer = (NOV_Helfer +1);
		DIA_Babo_Windfaust_permanent = TRUE; 
		B_GivePlayerXP (XP_Feger);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"FEGEN");
		
		B_LogEntry 	(Topic_ParlanFegen,"Babo me va a ayudar a barrer las cámaras de los novicios.");
		
	}
	else
	{
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_04"); //No, por ahora no.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_05"); //Entonces esperaré hasta que lo hagas.
	};
	AI_StopProcessInfos (self);
};


//***********************************************************************
//	 Wie ist das Leben hier im Kloster?
//***********************************************************************
INSTANCE DIA_Babo_Life   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 10;
	condition   = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent   = TRUE;
	description	= "¿Qué tal es la vida en el monasterio?";
};
FUNC INT DIA_Babo_Life_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Life_Info()
{
	AI_Output (other,self ,"DIA_Babo_Life_15_00"); //¿Qué tal es la vida en el monasterio?
	AI_Output (self ,other,"DIA_Babo_Life_03_01"); //No quiero parecer quejica, pero nunca que pensé que fuera a ser tan estricta. Si no te atienes las reglas, te castigan.
	AI_Output (self ,other,"DIA_Babo_Life_03_02"); //Por supuesto, muchos novicios quieren estudiar las enseñanzas de Innos en la biblioteca, para estar preparados por si son escogidos.
	AI_Output (self ,other,"DIA_Babo_Life_03_03"); //Pero yo creo que la mejor preparación para la prueba de la magia es cumplir con nuestras obligaciones.
	
	if (Npc_KnowsInfo (other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output (other,self ,"DIA_Babo_Life_15_04"); //¿Qué es eso del elegido y la prueba?
		AI_Output (self ,other,"DIA_Babo_Life_03_05"); //Habla con el hermano Igaraz. Sabe mucho del tema.
	};
};
//*********************************************************************
//		Sc hat Babo den Gärtnerposten verschafft (Kap. 2)
//*********************************************************************
INSTANCE DIA_Babo_HowIsIt   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 1;
	condition   = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent   = TRUE;
	description	= "¿Qué tal va todo?";
};
FUNC INT DIA_Babo_HowIsIt_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel < 3)
	{
		return TRUE;
	};	
};
//--------------------
var int Babo_XPgiven;
//--------------------
FUNC VOID DIA_Babo_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Babo_HowIsIt_15_00"); //¿Qué tal estás?
	
	if (MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_01"); //(Humildemente) Agradezco a los magos la tarea que me han encomendado..
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_02"); //Disfruto trabajando en el jardín y espero que los magos estén satisfechos conmigo, maestro.
		
		if (Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP (XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_03"); //(Sobresaltado) Bi... bi... bien, maestro.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_04"); //Tra... trabajo duro e intento no decepcionar a los magos.
	};
	
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 2
//##
//####################################################

INSTANCE DIA_Babo_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 3
//##
//####################################################

INSTANCE DIA_Babo_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//******************************
// hallo!
//******************************

INSTANCE DIA_Babo_Kap3_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent   = FALSE;
	description = "¿Qué estás haciendo aquí?";
};
FUNC INT DIA_Babo_Kap3_Hello_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Hello_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Hello_15_00"); //¿Qué haces aquí?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_01"); //(Con timidez) Intento realizar las tareas que se me encomiendan, para bien del monasterio.
	}	
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_02"); //No debo hablar contigo. No se ve con buenos ojos que hablemos con extraños.
	}; 
};

//*********************************************
//	Kopf hoch!
//*********************************************

INSTANCE DIA_Babo_Kap3_KeepTheFaith   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent   = FALSE;
	description = "Nunca debes perder la fe.";
};
FUNC INT DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_00"); //Nunca debes perder la fe.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_01"); //(Pillado) No,... quiero decir, nunca haría algo así. ¡De verdad!
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_02"); //Todos nos vemos sometidos a pruebas severas.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_03"); //Sí, maestro. Siempre lo recordaré. Gracias.
	
	B_GivePlayerXP (XP_Ambient); 
};

//*********************************************
//	Das klingt aber nicht sehr glücklich.
//*********************************************

INSTANCE DIA_Babo_Kap3_Unhappy   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent   = FALSE;
	description = "Eso no suena muy alegre.";
};
FUNC INT DIA_Babo_Kap3_Unhappy_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_15_00"); //No parece que estés muy contento.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_01"); //(Pillado) Bueno... quiero decir, en realidad todo va bien.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_02"); //Pero... bueno, no quiero ser quejica.

	Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Entonces deja de gimotear.",DIA_Babo_Kap3_Unhappy_Lament); 
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Venga, vamos, puedes decírmelo.",DIA_Babo_Kap3_Unhappy_TellMe);
};

	FUNC VOID DIA_Babo_Kap3_Unhappy_Lament ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_00"); //Entonces deja de gimotear.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01"); //(Con miedo) Yo... yo... por favor, no le digas nada a los magos.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02"); //No quiero que me vuelvan a castigar.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_03"); //Me lo pensaré.
		
		Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	};
	
	FUNC VOID DIA_Babo_Kap3_Unhappy_TellMe ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_00"); //Venga, vamos, cuéntamelo.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01"); //¿Y no se lo dirás a los magos?
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_02"); //¿Te parece que lo haría?
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03"); //De acuerdo. Tengo un problema con uno de los novicios. Me tiene pillado.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_04"); //Vamos, suéltalo de una vez.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05"); //El novicio es Igaraz y encontró algunos de mis papeles privados.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06"); //Amenazó con dárselos a los magos si no le obedecía.
		
		MIS_BabosDocs = LOG_RUNNING; 
		
		Log_CreateTopic (Topic_BabosDocs,LOG_MISSION);
		Log_SetTopicStatus (Topic_BabosDocs,LOG_RUNNING);
		B_LogEntry (Topic_BabosDocs,"Igaraz está chantajeando a Babo, el novicio, con ciertos documentos.");
		
		Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Me parece que es demasiado personal para mí.",DIA_Babo_Kap3_Unhappy_Privat);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"¿Qué se supone que tienes que hacer por él?",DIA_Babo_Kap3_Unhappy_ShouldDo);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"¿Y qué documentos son esos?",DIA_Babo_Kap3_Unhappy_Documents); 
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Quizá pueda ayudarte.",DIA_Babo_Kap3_Unhappy_CanHelpYou);
	};

		FUNC VOID DIA_Babo_Kap3_Unhappy_Privat ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_00"); //Me parece que es demasiado personal para mí.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01"); //Lo comprendo, no quieres problemas. Tendré que encargarme solo.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_02"); //Lo solucionarás.
		
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_ShouldDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00"); //¿Qué se supone que tienes que hacer por él?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01"); //No me gusta hablar de ello. En cualquier caso, no complacería a Innos.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02"); //No quiero ni pensar lo que ocurriría si se supiera.
		
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_Documents ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_00"); //¿Y qué documentos son esos?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01"); //(Inseguro) Eso no es asunto de nadie. Solo me concierne a mí.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_02"); //Vamos, cuéntamelo.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03"); //Son, eh... documentos completamente normales. Nada de particular.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_04"); //No preguntaré más.
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_CanHelpYou ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //Quizá podría ayudarte.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //¿Lo harías?
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //Eso depende, claro.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(Con rapidez) Por supuesto, te pagaría.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //¿Cuánto?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //Bueno, no tengo mucho dinero, pero te puedo dar un pergamino de conjuro. Tengo un conjuro de curación.
			
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Prefería mantenerme apartado de eso.",DIA_Babo_Kap3_Unhappy_No);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Veré lo que puedo hacer.",DIA_Babo_Kap3_Unhappy_Yes);
		};

			FUNC VOID DIA_Babo_Kap3_Unhappy_No ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_No_15_00"); //Prefería mantenerme al margen.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //Entonces no me queda más remedio que seguirle el juego.
			
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};
			
			FUNC VOID DIA_Babo_Kap3_Unhappy_Yes ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_00"); //Veré qué puedo hacer.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01"); //(Alegre) De verdad, tiene que salir bien. ¡Tiene que salir bien!
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02"); //Solo tienes que descubrir dónde guarda Igaraz el material. Se lo quitas y todo irá bien.
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_03"); //Tranquilo. Tú continúa con lo tuyo, del resto me encargo yo.
				
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};

//********************************
//Ich hab deine Dokumente
//********************************

INSTANCE DIA_Babo_Kap3_HaveYourDocs   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent   = FALSE;
	description = "Tengo los documentos.";
};
FUNC INT DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if ((MIS_BabosDocs == LOG_RUNNING				)
	&&   (Npc_HasItems (other,ItWr_BabosDocs_MIS) 	>= 1)
	||  ((Npc_HasItems (other,ItWr_BabosPinUp_MIS) 	>= 1)
	&&   (Npc_HasItems (other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_00"); //Tengo los documentos.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_01"); //¿De verdad? Gracias, me has salvado. No sé cómo agradecértelo.
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_02"); //Sí, sí, pero cálmate.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_03"); //(Nervioso) ¿Son los míos? ¿Seguro? Enséñamelos.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Me los voy a quedar un poco más.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	
	if (BaboSDocsOpen == TRUE)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Teniendo en cuenta los hechos, el precio ha subido.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Aquí están.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00"); //Me los voy a quedar un poco más.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01"); //(Aturdido) ¿¡Qué!? ¿Qué quieres decir? ¿Qué planeas?
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Solo bromeaba.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Ése es mi problema.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	
	if (Igaraz_IsPartner == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Igaraz y yo somos socios.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00"); //Solo bromeaba.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01"); //(Con aspereza) Ja, ja, perdona que no me ría. Bueno, ¿dónde están?
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02"); //Aquí tienes...
		
		if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
		{
			B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
		}
		else
		{
			B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
			B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
		};
		
		B_UseFakeScroll ();
		
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03"); //No quería insultarte, pero todo este asunto me tiene muy nervioso.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04"); //No pasa nada. Que lo pases bien con tus DOCUMENTOS.
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs);
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00"); //Eso es asunto mío.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01"); //Los documentos me pertenecen. No tienes derecho a quedártelos.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02"); //Hasta pronto.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00"); //Ahora Igaraz y yo somos socios.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01"); //(Aturdido) ¿Qué? No puedes hacerlo.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02"); //Parece que sí que puedo. Me quedaré esos papeles y todo seguirá como hasta ahora.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03"); //La parte financiera la trataré con Igaraz.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04"); //Bueno, que cuides bien de las plantas.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05"); //Eres un canalla. Un miserable y avaricioso canalla. Que Innos te castigue.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Piénsate lo que dices.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"¿No tienes nada que hacer?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
	};
	
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_End ()
		{
			AI_StopProcessInfos (self);
		};
		
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00"); //Piénsate lo que dices.
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01"); //Estoy siendo de lo más agradable, como siempre.
			
			AI_StopProcessInfos (self); 
		};
						
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00"); //¿No tienes nada que hacer?
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01"); //Lo entiendo, pero créeme, habrá consecuencias.
			
			AI_StopProcessInfos (self); 
		};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00"); //Teniendo en cuenta los hechos, el precio ha subido.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01"); //No eres mejor que los demás. ¿Qué es lo que quieres?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02"); //¿Qué es lo que tienes?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03"); //Te puedo dar 121 monedas de oro, es todo lo que hay.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"No será suficiente.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"De acuerdo.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00"); //No será suficiente.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01"); //Pero no tengo más dinero. Si lo hubiera sabido antes, nunca habría entrado en el monasterio.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //De acuerdo.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //Toma el dinero y el pergamino.
		
		CreateInvItems (self ,ItSc_MediumHeal,1);
		CreateInvItems (self ,ItMi_Gold,121);
		B_GiveInvItems (self,other,ItSc_MediumHeal,1);
		B_GiveInvItems (self ,other,ItMi_Gold,121);
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs); 
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00"); //Aquí están.
	
	if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
	}
	else
	{
		B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
	};
	
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01"); //Sí, está todo.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02"); //¿Los has mirado?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03"); //¿Cambiaría algo que lo hubiera hecho?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04"); //No, siempre y cuando los recupere.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05"); //Ahora espero poder volver a descansar tranquilo.
	
	CreateInvItems (self ,ItSc_MediumHeal,1);
	B_GiveInvItems (self,other,ItSc_MediumHeal,1);
	
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP (XP_BabosDocs);
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
};

//*********************************************
//	Bist du zufrieden?
//*********************************************

INSTANCE DIA_Babo_Kap3_Perm   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 39;
	condition   = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent   = TRUE;
	description = "¿Estás satisfecho con tus tareas?";
};
FUNC INT DIA_Babo_Kap3_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_00"); //¿Estás satisfecho con tus tareas?
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_01"); //(Poco convincente) Sí, por supuesto. Mi fe en la sabiduría y el poder de Innos me da fuerza.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_02"); //(Esquivando) No quiero parecer irrespetuoso, pero hoy tengo mucho que hacer.
		AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_03"); //Puedes continuar.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_04"); //(Aliviado) Gracias.
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_05"); //No pasa nada, pero tengo que volver al trabajo. Si no, no voy a acabar hoy.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_06"); //No quiero volver a tener que quedarme por la noche para acabar mis obligaciones y no meterme en problemas.
	};
	
	AI_StopProcessInfos (self); 
};



//####################################################
//##
//##	Kapitel 4
//##
//####################################################

INSTANCE DIA_Babo_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 5
//##
//####################################################

INSTANCE DIA_Babo_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babo_PICKPOCKET (C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 900;
	condition	= DIA_Babo_PICKPOCKET_Condition;
	information	= DIA_Babo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Babo_PICKPOCKET_Condition()
{
	C_Beklauen (17, 25);
};
 
FUNC VOID DIA_Babo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babo_PICKPOCKET);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_BACK 		,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};
	
func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};


