// ********************************************
//	B_ENDPRODUCTIONDIALOG	
//	------------------------
//	Invincible Flag muss nach jedem Dialog- Vorgang
//	wieder hart auf FALSE gestezt werden
// ********************************************
FUNC VOID  B_ENDPRODUCTIONDIALOG ()
{
	AI_StopProcessInfos(self);		
 	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE]= FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};
