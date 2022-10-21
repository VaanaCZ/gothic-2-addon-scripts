// ****************************
// B_TeleportOutOfOWDemonTower       (OWDemonTower: wird aufgerufen, wenn PC den Buchständer benutzt den Xardas in Gothic1 benutzt hat, um aus OWDemonTower raus zu kommen!
// ****************************

func void B_TeleportOutOfOWDemonTower_S0 ()
{	
		AI_Teleport		(self, "DT_MAINGATE");
		Snd_Play 		("MFX_TELEPORT_CAST");
};
