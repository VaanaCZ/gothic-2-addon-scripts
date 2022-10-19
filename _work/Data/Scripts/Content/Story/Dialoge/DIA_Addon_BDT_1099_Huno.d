//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //¿Qué quieres saber? ¡Lárgate!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //¿A qué estás esperando? ¡Vete al bar!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Parece que eres un maestro en lo tuyo.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Parece que eres un maestro en lo tuyo.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//No eres el primero que lo dice… ¿Traes el acero?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//¿Acero? No, creo que me confundes con
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hm… tu cara me resulta familiar. ¿Nos conocemos de algo?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Claro, del Campamento Viejo.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"No sé decirte de dónde.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno tiene material de herrería.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Claro, del Campamento Viejo.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//El Campamento Viejo… claro… eres el tipo curioso…Te tenía por muerto.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Si, suele pasar. ¿Quién más ha sobrevivido?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Unos cuantos. Algunos huyeron con Raven, como yo. Para muchos otros, el Campamento Viejo fue su tumba.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//No sé decirte de dónde.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm… las neuronas me fallan… en fin
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Cuéntame tu huida.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Cuéntame tu huida.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//El día que cayó la Barrera, estalló el caos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Unos se escondieron, otros huyeron y todo acabó saqueado.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//¿Tú qué hiciste?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Iba a largarme del campamento cuando, de repente, un dolor penetrante me recorrió el cuerpo.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//¡Me cayó un maldito rayo encima! Aún puedo oírlo
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Luego alguien me dijo que Thorus me había encontrado y me había llevado con él.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Necesito una armadura mejor.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Necesito una armadura mejor.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Pues llévate esta. Esteban tiene la culpa de que sea tan cara.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ese perro rastrero se embolsa una parte de todas las armaduras que vendo.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Comprar armadura pesada (Protección: armas 45, flechas 45. Coste: 2100 oro)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk dijo que me harías un buen precio.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //¿Fisk, dices? Hm, bueno, aún le debo un favor.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Comprar armadura pesada (Protección: armas 45, flechas 45. Coste: 1400 oro)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Vale, me llevaré la armadura.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Perfecto.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Sin oro, no hay armadura.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "Sobre el intento de asesinato de Esteban…";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(agresivo) ¿Qué quieres de mí?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Estoy buscando a la persona que planeó el ataque
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //¿Y por qué vienes a preguntarme a mí?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Pensé que igual sabías algo sobre el asunto.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //¡Yo no sé NADA!
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(suspira) ¡Ahora escucha! ¡Saca de aquí tu trasero antes de que pierda los nervios!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "He oído un par de cosas sobre ti…";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //He oído hablar sobre ti
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //¿Y?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //¿Otra vez? (amenazante) Más vale que ahora sea algo importante
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //¡He oído que no estabas en tu puesto cuando ocurrió el ataque!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(agresivo) ¿Y qué mas?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul dijo que odiabas a Esteban.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(agresivo) ¿Y? ¿Dijo eso? ¿Y qué más?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //¡Emilio mencionó tu nombre! ¡Seguro que sabes algo sobre el ataque?
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(calmadamente) Has estado hablando con Emilio, ¿eh?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //¡Y no es el único que sospecha de ti!
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //¿Y eso qué significa, eh?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "¡Quiero aliarme con el asesino!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "¡Si tú organizaste el ataque, pagarás por ello!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Parece que tengo a Huno entre la espada y la pared.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(amenazante) Yo también debería tener una charla con él. ¡Seguro que LUEGO piensa justo lo contrario!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nada más
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //¡Si tú organizaste el ataque, pagarás por ello!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(aburrido) ¡Eres idiota! ¿Crees que puedes ir por ahí defendiendo a Esteban?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //¡Largo de aquí!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //¡Quiero aliarme con el asesino!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //¿Contra Esteban? ¿De verdad? ¡Demuéstramelo!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Llevo demasiado tiempo esperando un envío de acero de los piratas.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Sospecho que Esteban lo ha capturado para vendérmelo luego más caro.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //No lo haría él mismo, claro está. Tiene contratados a un par de bandidos en el pantano.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //¿Cómo lo sabes?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Los bandidos borrachos hablan demasiado
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //¿Y ese bandido tan hablador tiene nombre?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Su nombre no te concierne, pero el tipo que andas buscando es JUAN. En cualquier caso, llevo tiempo sin verlo por el campamento.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Tendrás que buscarlo en el pantano.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno está esperando un envío de acero de los piratas. Cree que un tipo llamado Juan lo robó para Esteban. Se esconde en algún lugar de la ciénaga.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "¡Primero dime quién ordenó el ataque!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Vale, me ocuparé de esto por ti.", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //¡Vale, lo haré por ti!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Bien. Veamos si se puede confiar en ti.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //¡Antes dime quién anda detrás del ataque!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //No, no me fío de ti.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Mira, la próxima conversación que tenga será con la persona que organizó el ataque o con Esteban.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //De ti depende a quién me dirija.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(suspira) Está bien. Te prepararé un encuentro con el cerebro del ataque. Pero con mis condiciones, ¿de acuerdo?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Ve al bar y habla con el camarero. Él te contará todo.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno me dijo que hablara con Snaf.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Tengo el acero.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Tengo el acero.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //¿Y? ¿Estaba allí Juan?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Sí.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Lo sabía. Esa rata de Esteban era el culpable.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Eres un tipo legal. Para ser sincero, no esperaba esto de ti.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Toma, acepta esto como recompensa.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Y ahora, ¿qué hay de nuestro acuerdo?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //El hombre con el que quieres hablar te está esperando en el bar. Dirígete al camarero.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno me dijo que hablara con Snaf.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






