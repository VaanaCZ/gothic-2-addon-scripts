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
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Regardez qui voilà... 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Mon maître m'avait bien prévenu qu'Innos enverrait ses sous-fifres...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Mais je ne pensais pas que vous vous montreriez ici aussi rapidement.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Dans ce cas, pour vous féliciter de votre rapidité... (rires) je vous accorderai une mort rapide !
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"C'est VOUS qui allez mourir.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Vous avez vendu votre âme à Beliar !",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//C'est VOUS qui allez mourir.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(rires) Vous ne représentez aucun risque à mes yeux... Je porte l'épée de Beliar !
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Je mènerai les dragons vers le continent ! Ensemble, nous plongerons le monde des humains dans les ténèbres infinies !
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//Vous avez vendu votre âme à Beliar !
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//A bon prix. Il a fait de moi le général qui commandera ses armées.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//Et vous ? Savez-vous seulement ce que vaut VOTRE âme ?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parlé, maintenant. Commençons...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Je me contente d'exécuter ce qui doit être accompli.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//Je me contente d'exécuter ce qui doit être accompli.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(rires) Ecoutez-le donc... TU m'envoies un bien humble serviteur, Innos ! (rires retentissants)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parlé, maintenant. Commençons...",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Etes-vous certain que je suis un serviteur d'Innos ?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//Etes-vous certain que je suis un serviteur d'Innos ? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//Quoi ? Que dites-vous ?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//Ne pensez-vous pas que je puisse être un serviteur d'Adanos ?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(Rires) Balivernes !
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//Peut-être sers-je Beliar, moi aussi - ou peut-être me sers-je moi-même. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(méprisant) Dans ce cas, vous n'êtes même pas digne d'être mon adversaire !
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Assez parlé, maintenant. Commençons...",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Assez parlé, maintenant. Commençons...
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(méprisant) Ainsi, vous êtes pressé de mourir... Eh bien, puisque vous insistez...
	
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




 

