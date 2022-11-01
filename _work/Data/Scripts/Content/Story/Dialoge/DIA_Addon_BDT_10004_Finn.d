//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_EXIT   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 999;
	condition   = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Finn_PICKPOCKET (C_INFO)
{
	npc			= BDT_10004_Addon_Finn;
	nr			= 900;
	condition	= DIA_Addon_Finn_PICKPOCKET_Condition;
	information	= DIA_Addon_Finn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Finn_PICKPOCKET_Condition()
{
	C_Beklauen (35, 50);
};
 
FUNC VOID DIA_Addon_Finn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Finn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
	
func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Finn_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacker   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent   = TRUE;
	description = "¿De vuelta al trabajo?"; 
};
FUNC INT DIA_Addon_Finn_Hacker_Condition()
{	
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //¿De vuelta al trabajo?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //Sí, ahora quiero sacar de esta mina hasta el último átomo de oro.
};
//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hi   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 1;
	condition   = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE; 
};
FUNC INT DIA_Addon_Finn_Hi_Condition()
{	
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //¡Hola!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //(refunfuñando) ¿Qué quieres?
};

//----------------------------------------------------------------------
//	Info Hacke
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Hacke   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 2;
	condition   = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent   = FALSE;
	description = "¿Dónde consigo una piqueta?";
};
FUNC INT DIA_Addon_Finn_Hacke_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Finn_Hacke_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Hacke_15_00"); //¿Dónde consigo una piqueta?
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_01"); //Ve al herrero Huno. Pero, aunque consigas un pica, eso no quiere decir que puedas entrar en la mina.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_02"); //Si quieres entrar, tienes que hablar con Esteban.
	AI_Output (self, other, "DIA_Addon_Finn_Hacke_07_03"); //No te molestes en hablar con Thorus: sólo te dejará pasar si tienes una piedra roja.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Esteban   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 3;
	condition   = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent   = FALSE;
	description = "Dime, ¿qué opinas de Esteban?";
};
FUNC INT DIA_Addon_Finn_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Hacke)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Esteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Esteban_15_00"); //Dime, ¿qué opinas de Esteban?
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_01"); //(con prudencia) Es el jefe aquí… es… bueno, creo.
	AI_Output (self, other, "DIA_Addon_Finn_Esteban_07_02"); //(dudando) Siempre deja pasar a la mina a buenos chicos. Me refiero a los que saben algo de minería.
};

//----------------------------------------------------------------------
//	Info Esteban
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Profi (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 4;
	condition   = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent   = FALSE;
	description = "¿Y tú sabes algo de minería?";
};
FUNC INT DIA_Addon_Finn_Profi_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Finn_Esteban)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Profi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Finn_Profi_15_00"); //¿Y tú sabes algo de minería?
	AI_Output (self, other, "DIA_Addon_Finn_Profi_07_01"); //¡Yo soy el mejor!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10004_Finn_Mine   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 5;
	condition   = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //Claro, jefe. ¿Quieres ver cómo se trabaja de verdad en la mina? Pues me pongo a ello
	
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01");//Ah, algo más. Te revelaré el secreto de un cavador.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02");//De vez en cuando es buena idea no dejar de practicar.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03");//Si das un par de golpes y no sale nada, entonces rasca la roca lateralmente con la punta de la pica.
	AI_Output (self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04");//Con algo de suerte, así conseguirás varios trozos a la vez.
	
	B_Upgrade_hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Gold   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 6;
	condition   = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Finn_Gold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_00");//Bueno, hay algo que deberías saber. El oro no es mineral. Hay una diferencia muy importante.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_01");//O sea, ¿qué mujer se colgaría una cadena de mineral al cuello? (risas)
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_02");//Al picar, trabaja de arriba abajo. De ese modo, las pepitas se desprenden más fácilmente.
	AI_Output (self, other, "DIA_Addon_Finn_Gold_07_03");//Hay también cavadores que lo hacen al contrario, pero es una técnica más difícil.

	B_Upgrade_hero_HackChance(10);
};
//---------------------------------------------------------------------
//	Info einschätzen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_ein   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 7;
	condition   = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent   = TRUE;
	description = "¿Puedes evaluar mis dotes extrayendo oro?";
};
FUNC INT DIA_Addon_Finn_ein_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};
var int Finn_einmal;
var int Finn_Gratulation;
FUNC VOID DIA_Addon_Finn_ein_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_ein_15_00");//¿Puedes evaluar mis dotes extrayendo oro?
	
	if (Finn_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_01");//Claro. Llevo en esto más de 35 años. ¡Soy el evaluador perfecto!
		Finn_einmal = TRUE;
	};
	AI_Output (self, other, "DIA_Addon_Finn_ein_07_02");//De ti, diría que eres

	if (Hero_HackChance < 20)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_03"); //un absoluto principiante.
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_04"); //un raspador pasable.
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_05"); //un raspador de oro experimentado.
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_06"); //un auténtico cavador.
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_07"); //un cavador excelente.
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_08"); //un maestro cavador.
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Finn_ein_07_09"); //un gurú cavador.
		
		if (Finn_Gratulation == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Finn_ein_07_10");//Así que ahora eres tan bueno como yo. Enhorabuena.
			B_GivePlayerXP (XP_Ambient*2);
			Snd_Play ("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	
	
	var string ConcatText;
	
	ConcatText = ConcatStrings ("", IntToString (Hero_HackChance));
	ConcatText = ConcatStrings (ConcatText, " %");
	PrintScreen (concatText, -1, -1, FONT_ScreenSmall,2);
};

//----------------------------------------------------------------------
//	Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Attentat   (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 8;
	condition   = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent   = FALSE;
	description	= "Sobre el intento de asesinato de Esteban…";
};
FUNC INT DIA_Addon_Finn_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentats auf Esteban
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_00"); //(con cautela) ¿Sí?
	AI_Output (other, self, "DIA_Addon_Finn_Attentat_15_01"); //¿Tienes idea de quién anda detrás de esto?
	AI_Output (self, other, "DIA_Addon_Finn_Attentat_07_02"); //¿Por qué quieres saberlo?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"Quiero hablar con el tipo…",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Esteban quiere verlo muerto!",DIA_Addon_Finn_Attentat_ForTheBoss);
};
	
func void B_Addon_Finn_TellAll()
{
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_00"); //(contando) Cuando ocurrió el ataque, yo trataba de conseguir una piqueta del herrero Huno.
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_01"); //Pero no estaba.
	AI_Output (other, self, "DIA_Addon_Finn_TellAll_15_02"); //¿Y?
	AI_Output (self, other, "DIA_Addon_Finn_TellAll_07_03"); //Normalmente, SIEMPRE está. Es MUY sospechoso, en mi opinión.
	
	Finn_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Finn dice que Huno no estaba durante el ataque.");
};
	
func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output (other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //¡Esteban quiere verlo muerto!
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //¡Oh! ¿Trabajas para el jefe?
	AI_Output (self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //Entonces te contaré lo que sé.
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};
	
func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output (other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //Quiero hablar con el tipo
	AI_Output (self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //(con cautela) ¿Para? ¿Qué quieres de él?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Eso no te concierne!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Tengo información de interés para él!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Quiero liquidar a Esteban y busco un aliado!",DIA_Addon_Finn_Attentat_KillEsteban);
};	
		
func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output (other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //¡Quiero liquidar a Esteban y busco un aliado!
	AI_Output (self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //¡No quiero tener nada que ver!
	
	Finn_Petzt = TRUE;
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output (other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //¡Tengo información de interés para él!
	AI_Output (self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //Estás compinchado con el tipo que lo ordenó, ¿verdad?
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Quiero liquidar a Esteban y busco un aliado!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Eso no te concierne!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice (DIA_Addon_Finn_Attentat,"¡Claro que no!",DIA_Addon_Finn_Attentat_NoNo);
};

	func void DIA_Addon_Finn_Attentat_NoNo()
	{
		AI_Output (other, self, "DIA_Addon_Finn_NoNo_15_00"); //¡Claro que no!
		AI_Output (self, other, "DIA_Addon_Finn_NoNo_07_01"); //(pensándoselo) ¡Bien! Entonces te diré lo que sé.
		
		B_Addon_Finn_TellAll();
		Info_ClearChoices (DIA_Addon_Finn_Attentat);
	};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{	
	AI_Output (other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //¡Eso no te concierne!
	AI_Output (self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //¿Y? Bueno, entonces no sé nada sobre el asunto.
	
	Info_ClearChoices (DIA_Addon_Finn_Attentat);
};

//----------------------------------------------------------------------
//	Nochmal Attentat
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Finn_Again  (C_INFO)
{
	npc         = BDT_10004_Addon_Finn;
	nr          = 9;
	condition   = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent   = TRUE;
	description	= "Volviendo al ataque…";
};
FUNC INT DIA_Addon_Finn_Again_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat))
	&& (!Npc_IsDead(Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Finn_Again_Info()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_15_00"); //Volviendo a lo del ataque
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_01"); //Ya te he contado todo lo que sé.
		
		Info_ClearChoices (DIA_Addon_Finn_Again);
		Info_AddChoice (DIA_Addon_Finn_Again, "Bien… (de nuevo)", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice (DIA_Addon_Finn_Again, "¡Cuéntame otra vez!", DIA_Addon_Finn_Again_Nochmal);		
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Finn_Again_07_02"); //¡Déjame sólo con esa escoria!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //(pensándoselo) Vale
	Info_ClearChoices (DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output (other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //¡Pues dímelo otra vez!
	
	B_Addon_Finn_TellAll();
	
	Info_ClearChoices (DIA_Addon_Finn_Again);	
};


