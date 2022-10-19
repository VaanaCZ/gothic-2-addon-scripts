// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_EXIT (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
FUNC INT DIA_Addon_Raven_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	
// ************************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Raven_Hi (C_INFO)
{
	npc			= BDT_1090_Addon_Raven;
	nr			= 1;
	condition	= DIA_Addon_Raven_Hi_Condition;
	information	= DIA_Addon_Raven_Hi_Info;
	permanent	= FALSE;
	important	= TRUE;
};        
FUNC INT DIA_Addon_Raven_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Raven_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Guarda chi c'è. 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Il mio maestro mi ha avvertito che Innos avrebbe inviato i suoi scagnozzi.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Ma non mi aspettavo che saresti arrivato così presto.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Beh, visto che sei stato così veloce (ride), ti concederò una morte rapida.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"A morire sarai TU.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Hai venduto la tua anima a Beliar!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//A morire sarai TU.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(ride) Mi fai proprio ridere. Io porto la spada di Beliar.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Guiderò i draghi sulla terraferma. Insieme faremo precipitare il mondo degli uomini nell'oscurità più completa.
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Hai venduto la tua anima a Beliar!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Al giusto prezzo. Io sarò il generale che guiderà i suoi eserciti.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//E tu? Sai quanto vale la TUA anima?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ne ho abbastanza. Iniziamo…",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Faccio solo quello che va fatto.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Faccio solo quello che va fatto.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(ride) Sentilo. Innos, mi hai mandato un umile servitore! (ride ad alta voce)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ne ho abbastanza. Iniziamo…",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Sei sicuro che io sia un servitore di Innos?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Sei sicuro che io sia un servitore di Innos? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Cosa? Cosa stai dicendo?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Non pensi che io possa essere un servitore di Adanos?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(ride) Stupidaggini!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//Forse io servo ANCHE Beliar, oppure solo me stesso. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(ghigno beffardo) Beh, in quel caso non sei un avversario alla mia altezza!
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ne ho abbastanza. Iniziamo…",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Ne ho abbastanza. Iniziamo
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(ghigno beffardo) Hai tanta fretta di morire? Beh, se proprio insisti
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, daß Innos seine Schergen schicken würde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so früh auftauchst, hätte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung für mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland führen. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? Weißt du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) Hört ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //Hältst du es nicht für möglich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(höhnt) Nun, in diesem Fall wirst du nicht einmal ein würdiger Gegner für mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(höhnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

