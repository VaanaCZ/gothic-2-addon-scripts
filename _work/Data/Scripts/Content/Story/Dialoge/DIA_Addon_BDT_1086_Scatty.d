//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "¿Qué tal va el negocio?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//¿Cómo van los negocios?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Desde que se abrió la tumba, no ha habido mucha demanda.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Raven ya no necesita a los esclavos, por eso ahora se dedican a extraer oro. A las órdenes de Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//Y los cavadores se lo están tomando con calma. (murmura) Los cavadores lentos no son buenos para los negocios.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty vende multitud de artículos.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "¿Bloodwyn? ¿Es que su opinión cuenta para algo?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//¿Bloodwyn? ¿Es quien está al cargo?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Supervisa la mina, pero casi nunca baja. Pasa casi todo el tiempo con Raven en el templo.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//¿Qué significa exactamente 'casi nunca'?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//La última vez que lo vi fue cuando salió de la tumba
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(deprisa)… ¡No, espera! La última vez que lo vi fue cuando envió a los esclavos a extraer oro a la mina.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//A diferencia de Raven, le interesa MUCHO el oro.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "¿Qué clase de tumba?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//¿Qué clase de tumba?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//¡Una tumba maldita! ¡Los guardianes de la tumba han matado a mucha gente!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//¿Guardianes? ¿Te refieres a unas criaturas de piedra? ¿Lisas, con cabeza redonda?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//¡Sí, esos! Salieron a docenas de las profundidades de la roca.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Sabía desde el principio que no era bueno exhumar la tumba.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Pero Raven estaba obsesionado con la idea de hacerlo. Y cuando conseguimos sacar la tumba a la luz, él bajo con sus guardias.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "¿Qué quería Raven de la tumba?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//¿Qué quería Raven de la tumba?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(se detiene) Hm… eres muy curioso. Me recuerdas a un amigo que tuve.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Era igual que tú, y acabó pagándolo caro.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Al grano. ¿Qué ocurrió en la tumba?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//Pues… Ejem… tengo la garganta seca
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Eh, Scatty, AHORA NO. Esto es importante, ¿qué hizo Raven allí?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Vale. (respira hondo) L…llamó… invocó algo. Empezó a pronunciar palabras en un lenguaje muy extraño.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//La tumba comenzó a manar luz brillante y luego escuché un grito que me dejó helado, un grito demoníaco.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//¿Y entonces?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//Eso es todo lo que sé. En ese momento, Bloodwyn salió de la tumba y ordenó que me fuera. Y eso es lo que hice.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Raven y sus chicos tampoco tardaron mucho en desaparecer en el interior del templo. Desde entonces, no se ha vuelto a ver a Raven.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "¿Te apetece beber algo?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//¿Te apetece beber algo?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Una cerveza me vendría al pelo. Casi no hay cerveza en el campamento.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Quizá Lucía tenga alguna botella
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Por tu salud. (dar cerveza)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Aquí tienes.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Oh, qué rica. Gracias, amigo. Eres mi héroe.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Coge un piqueta y consigue un trozo de oro. Cualquiera puede hacerlo.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//De ese modo, romperás muchas pepitas. Por eso sólo debe hacerlo la gente que entienda de minería.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Te contaré más cuando tengas más experiencia.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Aprender a extraer oro (Coste: 2 PA/10%)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Cuéntame más de extraer oro.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Sobre todo, debes tener en cuenta que el oro no es mineral. Es blando como la mantequilla. Si golpeas con mucha fuerza, lo rompes.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Cada cavador tiene sus propios trucos para sacar pepitas decentes de la roca.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//Finalmente, esos trucos son los que acaban marcando la diferencia entre un buen y un mal cavador.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//Además, la práctica lo es todo. La única forma de mejorar es cavar y cavar.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn ha muerto.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn ha muerto.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hm, no se lo deseo a mucha gente, pero Bloodwyn está mucho mejor muerto.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


