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
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_00");//Mira qui�n ha venido. 
	if (C_BodyStateContains(self, BS_SIT))
	{
		NPC_StopAni (self,"T_PRAY_RANDOM");
		AI_PlayAniBS (self, "T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNpc (self,	other);
	};
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_01");//Mi maestro me advirti� que Innos enviar�a a sus secuaces.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_02");//Pero no esperaba que t� aparecieras tan pronto.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_03");//Bueno, como has sido tan r�pido (r�e), te dar� una muerte r�pida.
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"T� eres quien va a morir.",DIA_Addon_Raven_Hi_DU);
	Info_AddChoice (DIA_Addon_Raven_Hi,"�Has vendido tu alma a Beliar!",DIA_Addon_Raven_Hi_Soul);
};
FUNC VOID DIA_Addon_Raven_Hi_DU()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_00");//T� eres quien va a morir.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_04");//(r�e) No eres una amenaza para m�. Llevo la espada de Beliar.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_05");//Liderar� los dragones hacia el continente. Juntos sumiremos el mundo de los hombres en las tinieblas m�s absolutas.
};
FUNC VOID DIA_Addon_Raven_Hi_Soul()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_01");//�Has vendido tu alma a Beliar!
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_06");//Por un buen precio. Capitanear� sus ej�rcitos como general.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_07");//�Y t� qu�? �Sabes cu�nto vale TU alma?
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ya est�. Empecemos�",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"S�lo hago lo que hay que hacer.",DIA_Addon_Raven_Hi_only);

};
FUNC VOID DIA_Addon_Raven_Hi_only()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_02");//S�lo hago lo que hay que hacer.
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_08");//(r�e) Esc�chale. �Me env�as un siervo humilde, Innos! (r�e en alto)
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ya est�. Empecemos�",DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice (DIA_Addon_Raven_Hi,"�Est�s seguro de que soy siervo de Innos?",DIA_Addon_Raven_Hi_Sure);	
};
FUNC VOID DIA_Addon_Raven_Hi_Sure()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_03");//�Est�s seguro de que soy siervo de Innos? 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_09");//�C�mo? �Qu� quieres decir?
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_04");//�No has pensado en la posibilidad de que sea siervo de Adanos?
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_10");//(r�e) �Tonter�as!
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_05");//TAMBI�N puedo servir a Beliar, o a m� mismo. 
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_11");//(con desprecio) �Bueno, en ese caso, ni siquiera eres un rival digno!
	
	Info_ClearChoices (DIA_Addon_Raven_Hi);
	Info_AddChoice (DIA_Addon_Raven_Hi,"Ya est�. Empecemos�",DIA_Addon_Raven_Hi_Attack);
};
FUNC VOID DIA_Addon_Raven_Hi_Attack()
{
	AI_Output (other, self, "DIA_Addon_Raven_Add_15_06");//Ya est�. Empecemos
	AI_Output (self, other, "DIA_Addon_Raven_Add_10_12");//(con desprecio) �Tanta prisa tienes por morir? Bueno, ya que insistes
	
	AI_StopProcessInfos	(self); 
	B_Attack (self, other, AR_SuddenEnemyInferno,1);
};
/*
--------------
10 *NEU* DIA_Addon_Raven_Add_10_00 //Seht wer gekommen ist. 
10 *NEU* DIA_Addon_Raven_Add_10_01 //Mein Meister hat mich davor gewarnt, da� Innos seine Schergen schicken w�rde.
10 *NEU* DIA_Addon_Raven_Add_10_02 //Aber das du so fr�h auftauchst, h�tte ich nicht erwartet.
10 *NEU* DIA_Addon_Raven_Add_10_03 //Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_00 //DU bist derjenige der sterben wird.
10 *NEU* DIA_Addon_Raven_Add_10_04 //(lacht) Du bist keine Bedrohung f�r mich. Ich trage Beliars Schwert.
10 *NEU* DIA_Addon_Raven_Add_10_05 //Ich werde die Drachen auf's Festland f�hren. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 *NEU* DIA_Addon_Raven_Add_15_01 //Du hast deine Seele an Beliar verkauft!
10 *NEU* DIA_Addon_Raven_Add_10_06 //Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 *NEU* DIA_Addon_Raven_Add_10_07 //Und was ist mit dir? Wei�t du wieviel DEINE Seele wert ist?
--------------
15 *NEU* DIA_Addon_Raven_Add_15_02 //Ich mache nur das, was getan werden muss.
10 *NEU* DIA_Addon_Raven_Add_10_08 //(lacht) H�rt ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 *NEU* DIA_Addon_Raven_Add_15_03 //Bist du sicher, dass ich ein Diener Innos bin? 
10 *NEU* DIA_Addon_Raven_Add_10_09 //Was? Was redest du da?
15 *NEU* DIA_Addon_Raven_Add_15_04 //H�ltst du es nicht f�r m�glich das ich ein Diener Adanos bin?
10 *NEU* DIA_Addon_Raven_Add_10_10 //(lacht) Unsinn!
15 *NEU* DIA_Addon_Raven_Add_15_05 //Vielleicht diene auch ICH Beliar - oder nur mir selbst. 
10 *NEU* DIA_Addon_Raven_Add_10_11 //(h�hnt) Nun, in diesem Fall wirst du nicht einmal ein w�rdiger Gegner f�r mich sein!
--------------
15 *NEU* DIA_Addon_Raven_Add_15_06 //Mir reichts jetzt. Lass uns anfangen...
10 *NEU* DIA_Addon_Raven_Add_10_12 //(h�hnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/




 

