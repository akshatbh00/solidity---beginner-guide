const contractAddress = "0x123456789"; // replace with the actual contract address
const entryFee = 0.1; // replace with the actual entry fee in ether

async function enterLottery() {
    const web3 = new Web3(Web3.givenProvider);
    const accounts = await web3.eth.requestAccounts();
    const lotteryContract = new web3.eth.Contract(abi, contractAddress);
    const amount = web3.utils.toWei(document.getElementById("entryFee").value, "ether");
    try {
        await lotteryContract.methods.enter().send({ from: accounts[0], value: amount });
        document.getElementById("message").textContent = "Entered the lottery!";
    } catch (error) {
        console.error(error);
        document.getElementById("message").textContent = "Error entering the lottery";
    }
}

function pickWinner() {
    // TODO: implement this function to pick the winner of the lottery
}
