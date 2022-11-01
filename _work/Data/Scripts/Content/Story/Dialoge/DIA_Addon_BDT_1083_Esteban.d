//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Así que tú eres el tipo que luchó para entrar en el campamento.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Las noticias vuelan
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco era un hueso duro de roer. Nadie se metía en problemas con él. Nadie, menos tú.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Quiero dejarte las cosas claras, si intentas la misma mierda conmigo, te mataré.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "¡Quiero entrar a la mina!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//¡Quiero entrar a la mina!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(sonríe) Claro que quieres. Y estás en el lugar adecuado, conmigo.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Porque todo el que trabaja en la mina se queda una buena parte del oro.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//Y yo tengo las piedras rojas que necesitas para que Thorus te deje pasar.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Dame una de esas piedras rojas.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dame una de esas piedras rojas.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//De acuerdo, pero no son gratuitas.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Normalmente, pido una parte del oro que la gente consigue trabajando.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(evaluando) ¿Qué sabes tú de extraer oro, eh?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Habrás aprendido algunos trucos, ¿verdad?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//No pareces un experto en el tema
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(con malicia) Si te doy una piedra roja, no será por lo buen cavador que eres.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//No, tengo otro trabajo para ti
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "¿Qué tipo de trabajo?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//¿Qué tipo de trabajo?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Uno de los bandidos planeó matarme, pero lo único que consiguió es que mis guardias lo MATARAN.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Quería tu trabajo, ¿no?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//¡Era idiota! Un matón descerebrado. A él nunca se le hubiera ocurrido atacarme por sí solo.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//No, sólo cumplía un contrato, le enviaba otra persona
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Así que quieres que averigüe quién anda detrás.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Quien mandó a ese asesino, pagará por ello. Búscale y te dejaré entrar a la mina.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Me envía Senyan por ese asunto.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//¿Senyan? También trabaja para mí. Le dije que tuviera los ojos bien abiertos.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Han intentado matar a Esteban. Debo averiguar quién anda detrás.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "¿Cómo debo proceder?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//¿Cómo debo proceder?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Todos en el campamento saben algo, así que juegas con todas las cartas sobre la mesa.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//¡Intenta averiguar quién está de mi lado y quién no, y no dejes que los chicos se burlen de ti!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Habla con Snaf. Ese cocinero seboso se entera de todo.
	
	B_LogEntry (Topic_Addon_Esteban, "Para encontrar al responsable, tengo que hablar con todo el campamento y averiguar de qué lado están. Sería bueno visitar a Snaf, que se entera de todo.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Necesito mejor armadura.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Necesito una armadura mejor.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //¿Por qué? Lo que llevas no está  mal. ¡A ti te basta por ahora!
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Si completas este encargo, volveremos a hablar del tema
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "Sobre el encargo…";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//Sobre el encargo
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Escucha, tengo otras cosas de las que ocuparme.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Creí que te interesaría saber quién andaba detrás del ataque
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//¿Quién es? Dime su nombre para que mis guardias vayan a romperle el cuello.
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Se trata del comerciante Fisk. Ahora mismo está sentado en el bar tranquilamente, bebiendo
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//¡JA! Bien hecho, amigo. Mis guardias se ocuparán de él.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Ya lo habéis oído, chicos. A por Fisk.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Vuelve cuando hayas averiguado de quién se trata.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "¿Y qué pasará ahora?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//¿Y qué pasará ahora?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//¿Que qué pasará? Voy a decírtelo.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk sufrirá una dolorosa muerte. Y todos los del campamento se enterarán.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Será una advertencia general.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "¿Ahora me darás una piedra roja?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//¿Ahora me darás una piedra roja?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Has hecho un buen trabajo. Alguien como tú no puede echarse a perder en la mina.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Me serás mucho más útil aquí fuera. Te quedarás en el campamento y continuarás trabajando para mí.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Me lo pensaré.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Me lo pensaré.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Olvidas con quién estás hablando. Yo estoy aquí al cargo y harás lo que yo te diga.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//Y, como digo, trabajarás para mí y para nadie más. ¿Está claro?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "¿Intentas tomarme el pelo?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//¿Intentas tomarme el pelo?  Nunca hablamos de trabajar para ti.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//No le ofrezco a todos una oportunidad como ésta. Pero si no te gusta, puedes largarte del campamento
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//¿Y qué tal si cumples lo pactado y me das una piedra roja?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Eh, una palabra más y mis guardias irán también a por ti.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(sonríe) ¿Qué guardias?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//¿Qué…? Ah, entiendo… tratas de tomarme el pelo, pues espera
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "¡Dame la piedra YA o voy a por ella!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //¡Dame la piedra YA o voy a por ella!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Oh, veo que tienes ganas de morir. ¡Te voy a hacer un favor y voy a bajarte los humos!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




